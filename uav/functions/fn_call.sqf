#define THIS_MODULE uav
#include "x_macros.sqf"
private ["_unit", "_position", "_radius", "_name", "_checks"];

PARAMS_3(_unit, _position, _radius);

if (hasInterface) then {
    _name = "UAV";
    _checks = [
        [
            [_name, "called"],
            player getVariable QGVAR(uav_cooldown)
        ] call FUNC(helper,timeExceeded),

        [
            _name,
            X_JIP getVariable QGVAR(uav_progress)
        ] call FUNC(helper,inProgress),

        [
            [_name, "called"],
            _position,
            player,
            [GVAR(uav_distance_player), "of your position", "within"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"]
        ] call FUNC(helper,inVehicle)
    ];

    if !(isNil QMODULE(conversation)) then {
        [
            _checks,
            [
                "Crossroad communication",
                X_JIP getVariable QGVAR(conversation)
            ] call FUNC(helper,inProgress)
        ] call BIS_fnc_arrayPush;
    };

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            [_x] call FUNC(client,hint);
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    X_JIP setVariable [QGVAR(uav_call), true, true];
    player setVariable [QGVAR(uav_cooldown), time + GVAR(uav_time_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(call)]] call FUNC(network,mp);
    };
};

if (isServer && {X_JIP getVariable QGVAR(uav_call)}) then {
    X_JIP setVariable [QGVAR(uav_call), false, true];

    if (!isNil QMODULE(conversation) && {[
        _unit,
        _position,
        "UAV"
    ] call FUNC(conversation,request)}) exitWith {};

    X_JIP setVariable [QGVAR(uav_progress), true, true];

    _vehicle = [
        _position,
        GVAR(uav_type_aircraft),
        GVAR(uav_distance_spawn),
        GVAR(uav_amount_height),
        west
    ] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _crew = _vehicle select 1;

    _aircraft flyInHeight GVAR(uav_amount_height);
    _aircraft lock true;
    _aircraft setVehicleAmmo 0;

    _aircraft setVariable [QGVAR(uav_range), false];
    _aircraft setVariable [QGVAR(uav_airborne), call FUNC(common,time) + GVAR(uav_time_airborne)];

    {
        _x setCaptive true;
    } forEach _crew;

    [_aircraft, _position, _radius] spawn FUNC(THIS_MODULE,patrol);

    while {alive _aircraft && {canMove _aircraft}} do {
        if (call FUNC(common,time) > _aircraft getVariable QGVAR(uav_airborne)) exitWith {
            if !(isNil QMODULE(conversation)) then {
                [
                    [GVAR(crossroad), GVAR(crossroad2)],
                    [QUOTE(THIS_MODULE), "LowFuel"]
                ] call FUNC(conversation,radio);
            };

            if !(isNil QMODULE(marker)) then {
                [format ["uav_%1", _position]] call FUNC(marker,delete);
            };

            [_aircraft] spawn FUNC(server,exitMap);
        };

        if (_aircraft getVariable QGVAR(uav_range)) then {
            [_position, _radius] spawn FUNC(THIS_MODULE,ping);

            sleep GVAR(uav_time_ping);
        };

        sleep 2;
    };

    if (!canMove _aircraft) then {
        [_aircraft] call FUNC(vehicle,delete);
    };

    X_JIP setVariable [QGVAR(uav_progress), false, true];
};