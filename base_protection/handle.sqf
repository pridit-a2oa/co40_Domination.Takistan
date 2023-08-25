/**
 * Base Protection Module (Handler)
 */

#define THIS_MODULE base_protection
#include "x_macros.sqf"

if (hasInterface) then {
    player addEventHandler ["fired", {
        private ["_unit", "_magazine", "_projectile"];

        _unit = _this select 0;
        _magazine = _this select 5;
        _projectile = _this select 6;

        if ((position _unit) distance (markerPos QGVAR(base_south)) >= GVAR(base_protection_distance)) exitWith {};

        if (_magazine in GVAR(base_protection_projectiles_player)) then {
            deleteVehicle _projectile;
        };
    }];
};