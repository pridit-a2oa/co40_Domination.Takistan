/**
 * Vehicle Repair Module
 *
 * Description: This module enables players to repair vehicles.
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"

// Vehicles designated with repair capacity
GVAR(vehicle_repair_types) = [
    "MtvrRepair_DES_EP1",
    "UralRepair_TK_EP1"
];

// Minimum damage to initiate repair
GVAR(vehicle_repair_amount_damage) = 0.05;

// Maximum fuel level to initiate repair, if damage threshold not met
GVAR(vehicle_repair_amount_fuel) = 0.10;

// AddAction parameters that need to apply to existing clients & JIP
GVAR(vehicle_repair_player_action) = [
    "Give Repair Kit" call FUNC(common,BrownText),
    FUNCTION(inventory,transfer),
    "repair",
    8,
    false,
    true,
    "",
    "['repair', _target] call d_fnc_inventory_valid && {!(_target getVariable 'd_unconscious')}"
];

if (hasInterface) then {
    GVAR(repairing) = false;
    
    player setVariable [QGVAR(repair_full), false];
};

__cppfln(FUNC(THIS_MODULE,repair),THIS_MODULE\functions\fn_repair.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;