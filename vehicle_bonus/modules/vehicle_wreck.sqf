/**
 * Vehicle Bonus Module - Vehicle Wreck Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_bonus_types) find (typeOf _vehicle) == -1) exitWith {};

_vehicle setVariable [QGVAR(bonus), true, true];

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};

if (!isNil QMODULE(vehicle_wreck)) then {
    _vehicle setVariable [QGVAR(wreckable), true, true];
};