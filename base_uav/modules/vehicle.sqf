/**
 * Base UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([GVAR(base_uav_type_vehicle), typeOf _vehicle] call BIS_fnc_areEqual) exitWith {};

// Handles the logic of addAction to switch to camera pod, as this caters for respawning too.