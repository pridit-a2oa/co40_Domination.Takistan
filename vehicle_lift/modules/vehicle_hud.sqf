/**
 * Vehicle Lift Module - Vehicle HUD Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_lift_types) find (typeOf _vehicle) == -1) exitWith {};

disableSerialization;

// DIALOG("X_VEHICLE_WELCOME_DIALOG", 1500);