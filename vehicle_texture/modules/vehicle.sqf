/**
 * Vehicle Texture Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

if (isServer) then {
    private ["_texture"];

    _texture = ([0, GVAR(vehicle_texture_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);

    _vehicle setVariable [
        QGVAR(texture),
        ((GVAR(vehicle_texture_types) select _texture) select 1) select 0,
        true
    ];
};

if (hasInterface) then {
    private ["_texture"];

    waitUntil {!isNil {_vehicle getVariable QGVAR(texture)}};

    _texture = (_vehicle getVariable QGVAR(texture)) select 1;

    {
        _vehicle setObjectTexture [_forEachIndex, format ["%1.paa", _x]];
    } forEach _texture;
};