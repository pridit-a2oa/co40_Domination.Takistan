/**
 * Vehicle Texture Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

_textures = ([_vehicle] call FUNC(THIS_MODULE,find)) select 0;

_name = (_vehicle getVariable QGVAR(texture)) select 0;

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd format [
    "Switch Texture (%1/%2: %3)",
    (_textures find _name) + 1,
    count _textures,
    _name
];

_menu lbSetData [_index, "texture"];