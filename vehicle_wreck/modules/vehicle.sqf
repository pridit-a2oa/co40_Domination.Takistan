/**
 * Vehicle Wreck Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!(_vehicle getVariable QGVAR(wreckable))) exitWith {};

if (isNil {_vehicle getVariable QGVAR(rebuilt)}) then {
    _vehicle setVariable [QGVAR(rebuilt), false, true];
};

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};