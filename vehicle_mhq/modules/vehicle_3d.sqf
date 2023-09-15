/**
 * Vehicle MHQ Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle in GVAR(vehicle_mhq_types)) exitWith {""};

"<br />Mobile respawn"