/**
 * Vehicle Lift Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_lift_types) find _vehicle == -1) exitWith {""};

"<br />Lifts vehicles"