/**
 * Inventory - Medical Module
 */

#define THIS_MODULE inventory_medical
#include "x_macros.sqf"

// Type of item
GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Medkit", "medical"]
];

// Actions to persist for existing clients & JIP
GVAR(inventory_type_actions) = GVAR(inventory_type_actions) + [
    [
        "Give Medkit" call FUNC(common,BlueText),
        FUNCTION(inventory,transfer),
        "medical",
        8,
        false,
        true,
        "",
        "['medical', _target] call d_fnc_inventory_valid && {!(_target getVariable 'd_unconscious')}"
    ]
];

// Visibility in the dialog
GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    [QUOTE(THIS_MODULE), "ca\ui\data\cursor_firstaid_ca"]
];

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\medical\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;