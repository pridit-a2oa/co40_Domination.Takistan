/**
 * Vehicle Ramp Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ramp_types) find (typeOf _vehicle) == -1) exitWith {false};

["Ramp: Lower/Raise", "ramp"] call FUNC(vehicle_menu,populate);

true