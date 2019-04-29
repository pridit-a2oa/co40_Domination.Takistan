/**
 * Vehicle Respawn Module - Vehicle Bonus Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle setVariable [QGVAR(respawnable), false];