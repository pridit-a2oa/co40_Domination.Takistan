/**
 * Vehicle Wreck Module - Base 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_wreck_type_lifts) find _vehicle == -1) exitWith {""};

"<br />Lifts wrecks"