#include "x_macros.sqf"
private ["_max"];

_max = [];

{
    _max = _max + [_x select 0];
} forEach GVAR(vehicle_wreck_time_rebuild);

_max call BIS_fnc_greatestNum;