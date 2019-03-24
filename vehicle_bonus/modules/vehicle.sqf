/**
 * Vehicle Bonus Module - Perk Submodule
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (GVAR(bonus_vehicles) find (typeOf _vehicle) == -1) exitWith {};

if (!isNil QMODULE(perk)) then {
    [_vehicle] __submodule(perk);
};