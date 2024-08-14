/**
 * Vehicle Repair Module
 *
 * Description: This module enables players to repair vehicles.
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"

// Minimum damage to initiate repair
GVAR(vehicle_repair_amount_damage) = 0.05;

// Maximum fuel level to initiate repair, if damage threshold not met
GVAR(vehicle_repair_amount_fuel) = 0.10;

if (hasInterface) then {
    GVAR(repairing) = false;

    player setVariable [QGVAR(repair_full), false];
};

__cppfln(FUNC(THIS_MODULE,repair),THIS_MODULE\functions\fn_repair.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;