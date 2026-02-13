#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_name", "_target"];

PARAMS_1(_name);

if !(isServer) exitWith {};

{
    if ([_x getVariable "name", _name] call BIS_fnc_areEqual) exitWith {
        _target = _x
    };
} forEach (X_JIP getVariable QGVAR(targets));

if (isNil "_target") exitWith {};

_target setVariable [QGVAR(skip), true];