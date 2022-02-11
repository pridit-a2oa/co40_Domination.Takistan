/**
 * Base Protect Module - Vehicle Submodule
 */

#define THIS_MODULE base_protection
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addEventHandler ["fired", {
    private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

    PARAMS_7(_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile);

    if ((position _unit) distance (markerPos QGVAR(base_south)) >= GVAR(base_protection_distance)) exitWith {};

    if (_ammo in GVAR(base_protection_projectiles_vehicle)) then {
        deleteVehicle _projectile;
    };
}];