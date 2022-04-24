#include "x_macros.sqf"
private ["_vehicle", "_texture", "_textures"];

PARAMS_1(_vehicle);

_texture = ([0, GVAR(vehicle_texture_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);
_textures = [0, (GVAR(vehicle_texture_types) select _texture) select 1] call FUNC(common,arrayValues);

[_textures, _texture]