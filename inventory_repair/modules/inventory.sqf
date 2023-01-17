/**
 * Inventory Repair Module - Inventory Submodule
 */

#include "x_macros.sqf"

GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Repair Kit", "repair_kits"]
];

GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    ["repair_kits", "ca\ui\data\ui_action_repair_ca"]
];