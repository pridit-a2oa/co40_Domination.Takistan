#include "x_macros.sqf"
private ["_marker"];

PARAMS_1(_marker);

if ([markerPos _marker, [0,0,0]] call BIS_fnc_areEqual) exitWith {};

_marker