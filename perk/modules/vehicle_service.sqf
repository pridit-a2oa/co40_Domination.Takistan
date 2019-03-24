/**
 * Perk - Vehicle Service Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_perk = player getVariable QGVAR(perkFullRepair);

if (!isNil "_perk") then {
    _vehicle setDamage 0;
    
    if (fuel _vehicle < 0.6) then {
        _vehicle setFuel 0.6;
    };
};