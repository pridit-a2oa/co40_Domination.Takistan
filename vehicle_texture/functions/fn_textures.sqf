#include "x_macros.sqf"
private ["_vehicle", "_index", "_textures"];

PARAMS_1(_vehicle);

_index = ([GVAR(vehicle_texture_types), typeOf _vehicle] call BIS_fnc_findNestedElement) select 0;
_textures = [0, (GVAR(vehicle_texture_types) select _index) select 1] call FUNC(common,arrayValues);

[_index, _textures]