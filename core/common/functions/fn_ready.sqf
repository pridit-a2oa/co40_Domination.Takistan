#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

if !(alive _unit) exitWith {false};
if !([_unit, vehicle _unit] call BIS_fnc_areEqual) exitWith {false};
if (!isNil QMODULE(revive) && {_unit getVariable QGVAR(unconscious)}) exitWith {false};

true