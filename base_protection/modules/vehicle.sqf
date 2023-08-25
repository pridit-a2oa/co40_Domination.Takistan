/**
 * Base Protection Module - Vehicle Submodule
 */

#define THIS_MODULE base_protection
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addEventHandler ["fired", {
    private ["_unit", "_ammo", "_projectile"];

    _unit = _this select 0;
    _ammo = _this select 4;
    _projectile = _this select 6;

    if !(isPlayer _unit) exitWith {};
    if !(_ammo in GVAR(base_protection_projectiles_vehicle)) exitWith {};
    if ((position _unit) distance (markerPos QGVAR(base_south)) >= GVAR(base_protection_distance)) exitWith {};

    deleteVehicle _projectile;
}];