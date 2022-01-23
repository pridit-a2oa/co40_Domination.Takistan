/**
 * Vehicle Ammobox Module - Base 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find _vehicle == -1) exitWith {""};

"<br />Loads an ammobox"