#define THIS_MODULE squad
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

[player] joinSilent (group _unit);

call FUNC(THIS_MODULE,reveal);