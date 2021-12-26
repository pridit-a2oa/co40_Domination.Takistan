#include "x_macros.sqf"
private ["_max"];

_max = [];

{
    _max = _max + [_x select 0];
} forEach GVAR(base_rd_time_construct);

_max call BIS_fnc_greatestNum;