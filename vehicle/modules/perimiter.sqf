/**
 * Vehicle Module - Perimiter Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle_wreck) && {_vehicle getVariable QGVAR(wreckable)}) then {
    _vehicle setPos (_vehicle getVariable QGVAR(position));
} else {
    _vehicle setDamage 1;
};