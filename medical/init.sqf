/**
 * Medical Module
 *
 * Description: This module enables players to heal themselves.
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

// AddAction parameters that need to apply to existing clients & JIP
GVAR(medical_player_action) = [
    "Give Medkit" call FUNC(common,BrownText),
    FUNCTION(inventory,transfer),
    "medkits",
    8,
    false,
    true,
    "",
    "['medkits', _target] call d_fnc_inventory_valid && {!(_target getVariable 'd_unconscious')}"
];

// Damage threshold
GVAR(medical_threshold_damage) = 0.15;

if (hasInterface) then {
    GVAR(healing) = false;
    
    player setVariable [QGVAR(medkits), 0, true];
    player setVariable [QGVAR(medkits_max), 0, true];
};

__cppfln(FUNC(THIS_MODULE,heal),THIS_MODULE\functions\fn_heal.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;