/**
 * Inventory - Refuel Module
 */

#define THIS_MODULE inventory_refuel
#include "x_macros.sqf"

// Type of item
GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Fuel Cans", "refuel"]
];

// Visibility in the dialog
GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    [QUOTE(THIS_MODULE), "ca\ui\data\ui_action_refuel_ca"]
];

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\refuel\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;