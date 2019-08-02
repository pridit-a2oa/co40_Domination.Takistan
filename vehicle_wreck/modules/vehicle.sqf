/**
 * Vehicle Wreck Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!(_vehicle getVariable QGVAR(wreckable))) exitWith {};

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};