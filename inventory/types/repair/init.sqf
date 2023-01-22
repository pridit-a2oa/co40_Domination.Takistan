/**
 * Inventory - Repair Module
 */

#define THIS_MODULE inventory_repair
#include "x_macros.sqf"

// Type of item
GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Repair Kit", "repair"]
];

// Visibility in the dialog
GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    [QUOTE(THIS_MODULE), "ca\ui\data\ui_action_repair_ca"]
];

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\repair\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;