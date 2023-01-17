/**
 * Inventory Repair Module
 */

#define THIS_MODULE inventory_repair
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(repair_kits), 0, true];
    player setVariable [QGVAR(repair_kits_max), 0, true];
};

MODULE(THIS_MODULE) = true;