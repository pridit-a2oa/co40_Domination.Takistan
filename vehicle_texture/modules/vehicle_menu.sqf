/**
 * Vehicle Texture Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type", "_textures", "_texture", "_menu", "_index"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

_textures = ([_vehicle] call FUNC(THIS_MODULE,find)) select 0;

{
    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _textures set [_forEachIndex, _x select 0];
    };
} forEach _textures;

_texture = _vehicle getVariable QGVAR(texture);

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd format [
    "Switch Texture (%1/%2: %3)",
    (_textures find _texture) + 1,
    count _textures,
    _texture
];

_menu lbSetData [_index, "texture"];

if ([_texture, "*"] call KRON_StrInStr) then {
    DIALOG("X_VEHICLE_MENU_DIALOG", 1100) ctrlSetStructuredText parseText format [
        "<t size='0.9'>&#160;</t><br/><t size='1' align='left' valign='bottom'>%1</t>",
        "* Requires addon"
    ];
};