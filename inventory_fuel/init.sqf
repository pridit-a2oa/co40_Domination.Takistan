/**
 * Inventory Fuel Module
 */

#define THIS_MODULE inventory_fuel
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(fuel_cans), 0];
    player setVariable [QGVAR(fuel_cans_max), 1];
};

MODULE(THIS_MODULE) = true;