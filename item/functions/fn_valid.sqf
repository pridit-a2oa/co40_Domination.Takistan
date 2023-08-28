#include "x_macros.sqf"
private ["_item"];

PARAMS_1(_item);

if !([] call FUNC(common,ready)) exitWith {false};
if !(isNull (findDisplay 106)) exitWith {false};
if ([{[_x, _item] call BIS_fnc_areEqual} count (weapons player), 0] call BIS_fnc_areEqual) exitWith {false};

true