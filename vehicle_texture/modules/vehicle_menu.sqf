/**
 * Vehicle Texture Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type", "_textures", "_name"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {false};

_textures = ([_vehicle] call FUNC(THIS_MODULE,find)) select 0;

{
    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _textures set [_forEachIndex, _x select 0];
    };
} forEach _textures;

if (count _textures < 2) exitWith {false};

_name = _vehicle getVariable QGVAR(texture);

[
    format [
        "Switch Texture (%1/%2: %3)",
        (_textures find _name) + 1,
        count _textures,
        _name
    ],
    "texture"
] call FUNC(vehicle_menu,populate);

if ([_name, "*"] call KRON_StrInStr) then {
    DIALOG("X_VEHICLE_MENU_DIALOG", 1100) ctrlSetStructuredText parseText format [
        "<t size='0.9'>&#160;</t><br/><t size='1' align='left' valign='bottom'>%1</t>",
        "* Requires addon"
    ];
};

true