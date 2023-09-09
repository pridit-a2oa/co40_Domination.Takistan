#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_lifter", "_caller", "_attached"];

_lifter = _this select 0;
_caller = [_this, 1, ""] call FUNC(common,param);

_attached = _lifter getVariable QGVAR(attached);

if (isNil "_attached" || {isNull _attached}) exitWith {};

if (hasInterface) then {
    private ["_checks"];

    _checks = if !([_caller, ""] call BIS_fnc_areEqual) then {
        [
            if (count (nearestObjects [_attached, ["AllVehicles"], 15]) > 2) then {
                format [
                    "%1 cannot be released due to an obstruction or close proximity with another vehicle",
                    [typeOf _attached] call FUNC(vehicle,name)
                ];
            } else {true},

            [
                [[typeOf _attached] call FUNC(vehicle,name), "released"],
                player getVariable QGVAR(vehicle_lift_cooldown)
            ] call FUNC(helper,timeExceeded)
        ];
    } else {[]};

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({[typeName _x, "STRING"] call BIS_fnc_areEqual} count _checks > 0) exitWith {};

    player setVariable [QGVAR(vehicle_lift_cooldown), time + GVAR(vehicle_lift_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(detach)]] call FUNC(network,mp);
    };
};

if (isServer) then {
    private ["_position", "_lifted", "_driver", "_player", "_distance"];

    if !(isNull _lifter) then {
        _lifter setVariable [QGVAR(attached), objNull, true];
    };

    if (!([_caller, ""] call BIS_fnc_areEqual) && {(position _lifter) select 2 >= GVAR(vehicle_lift_height)}) then {
        waitUntil {
            sleep 0.1;

            ((position _lifter) select 2) < GVAR(vehicle_lift_height)
        };
    };

    detach _attached;

    _position = position _lifter;

    if (_position select 2 < 6) then {
        _position = _lifter modelToWorld ([[10, 0, 0], [-10, 0, 0]] call BIS_fnc_selectRandom);
    };

    _attached setPos [_position select 0, _position select 1, 0];

    if (!alive _attached && {!isNull (driver _lifter)}) then {
        _lifted = _attached getVariable QGVAR(lifted);

        if (isNil "_lifted") exitWith {};

        _driver = getPlayerUID (driver _lifter);

        _lifted set [1, _driver];

        _player = [_lifted select 2, _driver] call BIS_fnc_findNestedElement;

        _distance = (_lifted select 0) distance (position _attached);

        switch (true) do {
            case !([_player, []] call BIS_fnc_areEqual): {
                private ["_value"];

                _value = (_lifted select 2) select (_player select 0);
                _value set [1, _distance + (_value select 1)];
            };

            default {
                [_lifted select 2, [_driver, _distance]] call BIS_fnc_arrayPush;
            };
        };
    };

    [true, "setVectorUp", [_attached, surfaceNormal (position _attached)]] call FUNC(network,mp);
    [true, "enableSimulation", [_attached, true]] call FUNC(network,mp);

    [_attached, "lock", false] call FUNC(network,mp);

    if (!alive _attached && {_attached isKindOf "Air"}) then {
        [_attached] call FUNC(vehicle,freeze);
    };
};