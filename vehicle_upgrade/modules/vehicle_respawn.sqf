/**
 * Vehicle Upgrade Module - Vehicle Respawn Submodule
 */

#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

if !(_type in GVAR(vehicle_upgrade_types)) exitWith {_type};

"M1133_MEV_EP1"