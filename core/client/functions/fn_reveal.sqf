#include "x_macros.sqf"
private ["_distance"];

PARAMS_1(_distance);

{
    player reveal _x;
} forEach ((position player) nearObjects _distance);