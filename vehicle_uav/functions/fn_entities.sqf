#include "x_macros.sqf"
private ["_entities"];

_entities = [];

{
    {
        _entities = _entities + [_x];
    } forEach (entities _x);
} forEach GVAR(vehicle_uav_types);

_entities