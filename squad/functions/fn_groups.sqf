#include "x_macros.sqf"
private ["_groups"];

_groups = [];

{
    if (str(_x) in (_this select 0)) then {
        _groups = _groups + [_x];
    };
} forEach allGroups;

_groups