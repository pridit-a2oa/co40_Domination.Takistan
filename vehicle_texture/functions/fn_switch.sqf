#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type", "_textures", "_options", "_texture"];

PARAMS_1(_vehicle);

if !(hasInterface) exitWith {};

_type = [_this, 1, _vehicle getVariable QGVAR(texture)] call FUNC(common,param);

_textures = [_vehicle] call FUNC(THIS_MODULE,textures);

_options = [_textures select 1] call FUNC(THIS_MODULE,options);

_texture = ((GVAR(vehicle_texture_types) select (_textures select 0)) select 1) select (_options find (_type select 0));

if ([typeName (_texture select 0), "STRING"] call BIS_fnc_areEqual || {[_texture select 0] call FUNC(THIS_MODULE,addon)}) then {
    {
        _vehicle setObjectTexture [_forEachIndex, format ["%1.paa", _x]];
    } forEach (_texture select 1);
};