#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_unit", "_position", "_caller", "_drop", "_name", "_checks", "_vehicle", "_aircraft", "_crew", "_pilot", "_group", "_load"];

PARAMS_4(_unit, _position, _caller, _drop);

if (hasInterface) then {
    if (isNil "_drop") then {
        _drop = (player getVariable QGVAR(airdrop_type)) select 1;

        _this set [3, _drop];
    };

    _name = "Airdrop";
    _checks = [
        [
            [_name, "called"],
            player getVariable QGVAR(airdrop_type)
        ] call FUNC(helper,isDuplicate),

        [
            [_name, "called"],
            player getVariable QGVAR(airdrop_cooldown)
        ] call FUNC(helper,timeExceeded),

        [
            _name,
            X_JIPH getVariable QGVAR(airdrop_progress)
        ] call FUNC(helper,inProgress),

        [
            [_name, "called"],
            _position,
            player,
            [GVAR(airdrop_distance_player), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"],
            _position,
            markerPos QGVAR(base_south),
            [GVAR(airdrop_distance_base), "in excess of", "from base"]
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

    X_JIPH setVariable [QGVAR(airdrop_call), true, true];
    player setVariable [QGVAR(airdrop_cooldown), time + GVAR(airdrop_time_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(call)]] call FUNC(network,mp);
    };
};

if (isServer && {X_JIPH getVariable QGVAR(airdrop_call)}) then {
    X_JIPH setVariable [QGVAR(airdrop_call), false, true];
    X_JIPH setVariable [QGVAR(airdrop_progress), true, true];

    if !(isNil QMODULE(conversation)) then {
        [_unit, _position, "airdrop"] call FUNC(conversation,request);
    };

    if (!isNil QMODULE(database) && {!isNil "_caller"}) then {
        [_caller, 1] spawn FUNC(database,statistic);
    };

    GVAR(airdrop_type_smoke) createVehicle _position;

    _vehicle = [
        _position,
        GVAR(airdrop_type_aircraft),
        GVAR(airdrop_distance_spawn),
        400,
        west
    ] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _crew = _vehicle select 1;
    _pilot = driver _aircraft;

    _aircraft flyInHeight 200;

    {
        _x setCaptive true;
    } forEach _crew;

    _pilot setSkill 1;
    _pilot doMove _position;

    _group = group (driver _aircraft);

    while {alive _aircraft && {canMove _aircraft}} do {
        if (_aircraft distance _position < 650) exitWith {
            _load = [_aircraft, _position, _drop, ""] call FUNC(common,paradrop);

            if !((typeOf _load) isKindOf "ReammoBox") then {
                if !(isNil "_caller") then {
                    _load setVariable [QGVAR(caller), _caller, true];
                };

                if (!isNil QMODULE(vehicle_abandon)) then {
                    _load setVariable [QGVAR(abandon), true];
                };

                if (!isNil QMODULE(vehicle_respawn)) then {
                    _load setVariable [QGVAR(respawnable), false, true];
                };
            };

            __addDead(_load);

            while {alive _aircraft && {canMove _aircraft}} do {
                if (unitReady _pilot) exitWith {
                    [_aircraft] spawn FUNC(server,exitMap);
                };

                sleep 2;
            };
        };

        sleep 1;
    };

    X_JIPH setVariable [QGVAR(airdrop_progress), false, true];
};