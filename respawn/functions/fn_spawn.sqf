#define THIS_MODULE respawn
#include "x_macros.sqf"
private ["_unit", "_position", "_type", "_objects", "_object"];

PARAMS_2(_unit, _position);

_type = (_unit getVariable QGVAR(respawn_type)) select 1;

_unit setDir 240.214;

if (_type == "base") exitWith {};

_objects = nearestObjects [
    _position,
    call compile format ["d_vehicle_%1_types", _type],
    call compile format ["d_vehicle_%1_distance_respawn", _type]
];

{
    if (_x getVariable QGVAR(deployed)) exitWith {
        _object = _x;
    };
} forEach _objects;

if (!isNil "_object") then {
    _vehicle = _object modelToWorld ([typeOf _object] call FUNC(vehicle,offsetPlayer));
    
    _unit setDir (getDir _object);
    _unit setPos [_vehicle select 0, _vehicle select 1, 0];
};