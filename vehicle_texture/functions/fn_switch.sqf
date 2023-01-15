#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type", "_find", "_textures", "_texture"];

PARAMS_1(_vehicle);

_type = [_this, 1, _vehicle getVariable QGVAR(texture)] call FUNC(common,param);

if !(hasInterface) exitWith {};

_find = [_vehicle] call FUNC(THIS_MODULE,find);

_textures = [];

{
    _textures set [
        _forEachIndex,
        if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x}
    ];
} forEach (_find select 0);

_texture = ((GVAR(vehicle_texture_types) select (_find select 1)) select 1) select (_textures find _type);

if ([typeName (_texture select 0), "STRING"] call BIS_fnc_areEqual || {[typeName (_texture select 0), "ARRAY"] call BIS_fnc_areEqual && {isClass ((_texture select 0) select 1)}}) then {
    {
        _vehicle setObjectTexture [_forEachIndex, format ["%1.paa", _x]];
    } forEach (_texture select 1);
};