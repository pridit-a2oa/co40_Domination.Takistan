#include "x_macros.sqf"

disableSerialization;

if !([player] call FUNC(common,ready)) exitWith {false};
if !(isNull (findDisplay 106)) exitWith {false};
if ([{[_x, GVAR(intel_type_item)] call BIS_fnc_areEqual} count (weapons player), 0] call BIS_fnc_areEqual) exitWith {false};

true