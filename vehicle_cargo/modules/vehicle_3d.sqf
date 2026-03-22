/**
 * Vehicle Cargo Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle in ([0, GVAR(vehicle_cargo_types)] call FUNC(common,arrayValues))) exitWith {[]};

["Cargo Carrier"]