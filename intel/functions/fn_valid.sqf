#include "x_macros.sqf"

disableSerialization;

if !(alive player) exitWith {false};
if (player getVariable QGVAR(unconscious)) exitWith {false};
if !(isNull (findDisplay 106)) exitWith {false};
if !({[_x, GVAR(intel_type_item)] call BIS_fnc_areEqual} count (weapons player) > 0) exitWith {false};

true