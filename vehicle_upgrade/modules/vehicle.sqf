/**
 * Vehicle Upgrade Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_upgrade_types)) exitWith {false};

_vehicle setVariable [QGVAR(upgrade), false, true];