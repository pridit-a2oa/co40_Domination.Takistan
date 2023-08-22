#include "x_macros.sqf"
private ["_addon"];

PARAMS_1(_addon);

if ([typeName _addon, "ARRAY"] call BIS_fnc_areEqual && {!((_addon select 1) select 1)}) exitWith {false};

true