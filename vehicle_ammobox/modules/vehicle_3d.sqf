/**
 * Vehicle Ammobox Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle in GVAR(vehicle_ammobox_types)) exitWith {""};

"<br />Loads ammobox"