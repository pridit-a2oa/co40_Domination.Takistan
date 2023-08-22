/**
 * Vehicle Texture Module (Handler)
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_types"];

_types = GVAR(vehicle_texture_types);

{
    private ["_type", "_textures"];

    _type = (_types select _forEachIndex) select 0;

    _textures = [
        ["Default", [_type] call FUNC(THIS_MODULE,default)]
    ];

    {
        [_textures, _x] call BIS_fnc_arrayPush;
    } forEach (_x select 1);

    _types set [_forEachIndex, [_type, _textures]];
} forEach _types;

GVAR(vehicle_texture_types) = _types;

true