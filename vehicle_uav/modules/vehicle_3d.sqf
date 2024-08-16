/**
 * Vehicle UAV Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([GVAR(vehicle_uav_type), _vehicle] call BIS_fnc_areEqual) exitWith {""};

"<br />Remote-controlled"