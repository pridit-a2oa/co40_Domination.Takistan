/**
 * Vehicle Bonus Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_bonus = _vehicle getVariable QGVAR(bonus);

if (isNil "_bonus") exitWith {};

if (hasInterface) then {
    if (!isNil QMODULE(perk)) then {
        [_vehicle] __submoduleVM(perk);
    };
};

if (isServer) then {
    _vehicle setVehicleAmmo GVAR(vehicle_bonus_capacity_ammo);
};