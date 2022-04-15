/**
 * Vehicle Fuel Module - Inventory Submodule
 */

#include "x_macros.sqf"

GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Fuel Cans", "fuel_cans"]
];

GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    ["fuel_cans", "ca\ui\data\ui_action_refuel_ca"]
];