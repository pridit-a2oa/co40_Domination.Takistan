/**
 * Inventory - Repair Module
 */

#define THIS_MODULE inventory_repair
#include "x_macros.sqf"

// Type of item
GVAR(inventory_types) = GVAR(inventory_types) + [
    ["Repair Kit", "repair"]
];

// Actions to persist for existing clients & JIP
GVAR(inventory_type_actions) = GVAR(inventory_type_actions) + [
    [
        "Give Repair Kit" call FUNC(common,BlueText),
        FUNCTION(inventory,transfer),
        "repair",
        8,
        false,
        true,
        "",
        "['repair', _target] call d_fnc_inventory_valid && {!(_target getVariable 'd_unconscious')}"
    ]
];

// Visibility in the dialog
GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
    [QUOTE(THIS_MODULE), "ca\ui\data\ui_action_repair_ca"]
];

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\repair\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;