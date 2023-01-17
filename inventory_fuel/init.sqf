/**
 * Inventory Fuel Module
 */

#define THIS_MODULE inventory_fuel
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(fuel_cans), 0];
    player setVariable [QGVAR(fuel_cans_max), 0];
};

__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;