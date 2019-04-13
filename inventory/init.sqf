/**
 * Inventory Module
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

// Set valid types
GVAR(inventory_types) = [];

__cppfln(FUNC(THIS_MODULE,transfer),THIS_MODULE\functions\fn_transfer.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;