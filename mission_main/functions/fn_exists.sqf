#include "x_macros.sqf"
private ["_target", "_objects", "_exists", "_vehicles"];

PARAMS_2(_target, _objects);

_exists = false;

_vehicles = nearestObjects [position _target, ["Air"], GVAR(mission_main_radius_zone) + 500];

{
    if ((typeOf _x) in _objects && {{!isPlayer _x && {alive _x}} count crew _x > 0}) exitWith {
        _exists = true;
    };
} forEach _vehicles;

_exists