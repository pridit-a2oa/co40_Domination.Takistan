#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = str _unit;

if ([str (markerPos _marker), "[0,0,0]"] call BIS_fnc_areEqual) exitWith {};

_marker