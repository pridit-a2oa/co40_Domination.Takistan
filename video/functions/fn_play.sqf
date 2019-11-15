#include "x_macros.sqf"

PARAMS_2(_path, _size);

if ((player getVariable QGVAR(video)) select 1 == "false") exitWith {};

[_path, _size] call BIS_fnc_customGPSvideo;