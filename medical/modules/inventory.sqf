/**
 * Medical Module - Inventory Submodule
 */

#include "x_macros.sqf"

GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Medkit", "medkits"]
];

GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    ["medkits", "\ca\ui\data\cursor_firstaid_ca"]
];