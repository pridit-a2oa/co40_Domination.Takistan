/**
 * Inventory Module
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

// Set valid types
GVAR(inventory_types) = [];

if (!isNil QMODULE(medical)) then {
    GVAR(inventory_types) = GVAR(inventory_types) + ["Medkits"];
};

if (!isNil QMODULE(vehicle_service)) then {
    GVAR(inventory_types) = GVAR(inventory_types) + ["RepairKits"];
};

__cppfln(FUNC(THIS_MODULE,transfer),THIS_MODULE\functions\fn_transfer.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;