/**
 * Vehicle Create Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_type in ([0, GVAR(vehicle_create_types)] call FUNC(common,arrayValues))) exitWith {""};

"<br />Vehicle Spawner"