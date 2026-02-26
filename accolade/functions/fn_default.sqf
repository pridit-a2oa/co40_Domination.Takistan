#include "x_macros.sqf"
private ["_amount", "_array"];

PARAMS_1(_amount);

_array = [];

for "_i" from 1 to _amount do {
    [_array, [0, 0]] call BIS_fnc_arrayPush;
};

_array