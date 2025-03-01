#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

if !([_caller, player] call BIS_fnc_areEqual) exitWith {};

[_target, false] spawn FUNC(THIS_MODULE,control);