#include "x_macros.sqf"
private ["_unit"];

_unit = [_this, 0, player] call FUNC(common,param);

if !(alive _unit) exitWith {false};
if !([_unit, vehicle _unit] call BIS_fnc_areEqual) exitWith {false};
if (!isNil QMODULE(revive) && {_unit getVariable QGVAR(unconscious)}) exitWith {false};

true