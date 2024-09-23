/**
 * Vehicle Upgrade Module - Vehicle Respawn Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_upgrade_types)) exitWith {_type};

_vehicle getVariable QGVAR(type)