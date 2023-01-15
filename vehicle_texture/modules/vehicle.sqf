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
    private ["_type", "_texture"];

    _type = ([0, GVAR(vehicle_texture_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);

    _texture = ((GVAR(vehicle_texture_types) select _type) select 1) select 0;
    _texture = if ([typeName _texture, "ARRAY"] call BIS_fnc_areEqual) then {_texture select 0} else {_texture};

    _vehicle setVariable [QGVAR(texture), _texture, true];
};

if (hasInterface) then {
    waitUntil {!isNil {_vehicle getVariable QGVAR(texture)}};

    [_vehicle] call FUNC(THIS_MODULE,switch);
};