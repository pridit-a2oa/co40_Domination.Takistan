#include "x_macros.sqf"
private ["_object", "_position", "_direction", "_objects", "_parent"];

PARAMS_3(_object, _position, _direction);

if !([_object, GVAR(tent_type_object)] call BIS_fnc_areEqual) exitWith {[]};

_objects = [];

_parent = createVehicle ["HeliHEmpty", _position, [], 0, "CAN_COLLIDE"];
_parent setDir _direction;
_parent setPos _position;

{
    [_objects, [
        _x select 0,
        _parent modelToWorld (_x select 1),
        _direction + (_x select 2)
    ]] call BIS_fnc_arrayPush;
} forEach (GVAR(tent_type_groups) call BIS_fnc_selectRandom);

_objects