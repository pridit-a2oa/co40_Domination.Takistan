/**
 * Base Protect Module (Handler)
 */

#define THIS_MODULE base_protect
#include "x_macros.sqf"

if (hasInterface) then {
    player addEventHandler ["fired", {
        private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

        PARAMS_7(_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile);

        if ((position _unit) distance (markerPos QGVAR(base_south)) >= GVAR(base_protect_distance)) exitWith {};

        if (_magazine in GVAR(base_protect_projectiles_player)) then {
            deleteVehicle _projectile;
        };
    }];
};