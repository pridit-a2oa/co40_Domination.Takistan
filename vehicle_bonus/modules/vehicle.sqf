/**
 * Vehicle Bonus Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_bonus = _vehicle getVariable QGVAR(bonus);

if (isNil "_bonus") exitWith {};

if (!isNil QMODULE(perk)) then {
    [_vehicle] __submoduleVM(perk);
};