#define THIS_MODULE airtaxi
#include "x_macros.sqf"
private ["_unit", "_position", "_name", "_checks", "_minimum", "_near", "_maximum", "_vehicle", "_aircraft", "_crew", "_pilot", "_helper"];

PARAMS_2(_unit, _position);

if (hasInterface) then {
    _name = "Air taxi";
    _checks = [
        [
            [_name, "called"],
            player getVariable QGVAR(air_taxi_cooldown)
        ] call FUNC(helper,timeExceeded),

        [
            _name,
            X_JIPH getVariable QGVAR(air_taxi_progress)
        ] call FUNC(helper,inProgress),

        [
            _name,
            _position,
            east,
            GVAR(air_taxi_distance_enemy)
        ] call FUNC(helper,nearSide),

        [
            [_name, "called"],
            _position,
            player,
            [GVAR(air_taxi_distance_player), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"],
            _position,
            markerPos QGVAR(base_south),
            [GVAR(air_taxi_distance_base), "in excess of", "from base"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"]
        ] call FUNC(helper,inVehicle)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    X_JIPH setVariable [QGVAR(air_taxi_call), true, true];
    player setVariable [QGVAR(air_taxi_cooldown), time + GVAR(air_taxi_time_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(call)]] call FUNC(network,mp);
    };
};

if (isServer && {X_JIPH getVariable QGVAR(air_taxi_call)}) then {
    X_JIPH setVariable [QGVAR(air_taxi_call), false, true];
    X_JIPH setVariable [QGVAR(air_taxi_progress), true, true];

    if !(isNil QMODULE(conversation)) then {
        [_unit, _position, "air taxi"] call FUNC(conversation,request);
    };

    GVAR(air_taxi_type_smoke) createVehicle _position;

    _vehicle = [
        _position,
        GVAR(air_taxi_type_aircraft),
        GVAR(air_taxi_distance_spawn),
        400,
        west
    ] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _crew = _vehicle select 1;
    _pilot = driver _aircraft;

    {
        _x addEventHandler ["HandleDamage", {0}];
    } forEach _crew;

    _aircraft flyInHeight 80;
    _aircraft lockDriver true;

    _pilot setSkill 1;
    _pilot doMove _position;

    (group _pilot) setBehaviour "CARELESS";

    _helper = "HeliHEmpty" createVehicleLocal _position;

    while {alive _aircraft && {canMove _aircraft}} do {
        if (unitReady _pilot) exitWith {
            sleep 0.1;

            _aircraft land "LAND";

            while {alive _aircraft && {canMove _aircraft}} do {
                if (speed _aircraft < 1 && {(position _aircraft) select 2 > 1}) then {
                    _aircraft land "LAND";

                    sleep 5;
                };

                if (speed _aircraft > -1 && {speed _aircraft < 0.01 && {(position _aircraft) select 2 < 2}}) exitWith {
                    deleteVehicle _helper;

                    if !(isNil QMODULE(conversation)) then {
                        [
                            [GVAR(crossroad), GVAR(crossroad2)],
                            [QUOTE(THIS_MODULE), "Depart"],
                            [
                                ["Time", {}, format ["%1 second(s)", GVAR(air_taxi_time_wait)], []]
                            ]
                        ] call FUNC(conversation,radio);
                    };

                    sleep GVAR(air_taxi_time_wait);

                    _pilot doMove (markerPos QGVAR(airtaxi));

                    while {alive _aircraft && {canMove _aircraft}} do {
                        if (unitReady _pilot) exitWith {
                            sleep 0.1;

                            _aircraft land "LAND";

                            while {alive _aircraft && {canMove _aircraft}} do {
                                if (speed _aircraft > -1 && {speed _aircraft < 0.01 && {(position _aircraft) select 2 < 1}}) exitWith {
                                    {
                                        if (isPlayer _x) then {
                                            moveOut _x;
                                        };
                                    } forEach crew _aircraft;

                                    _aircraft lock true;

                                    [_aircraft] spawn FUNC(server,exitMap);
                                };

                                sleep 2;
                            };
                        };

                        sleep 2;
                    };
                };

                sleep 2;
            };
        };

        sleep 2;
    };

    if (!canMove _aircraft) then {
        [true, "vehicleChat", [_aircraft, "We've been hit! Critical damage! Eject now!"]] call FUNC(network,mp);

        sleep 15;

        {
            deleteVehicle _x;
        } forEach _crew;

        if (alive _aircraft) then {
            _aircraft setDamage 1;
        };
    };

    if (!isNil "_helper") then {
        deleteVehicle _helper;
    };

    X_JIPH setVariable [QGVAR(air_taxi_progress), false, true];
};