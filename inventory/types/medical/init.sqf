/**
 * Inventory - Medical Module
 */

#define THIS_MODULE inventory_medical
#include "x_macros.sqf"

// Type of item
GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Medkit", "medical"]
];

// Visibility in the dialog
GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    [QUOTE(THIS_MODULE), "ca\ui\data\cursor_firstaid_ca"]
];

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\medical\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;