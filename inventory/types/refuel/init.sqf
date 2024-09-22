/**
 * Inventory - Refuel Module
 */

#define THIS_MODULE inventory_refuel
#include "x_macros.sqf"

// Type of item
GVAR(inventory_refuel_type) = [
    "Fuel Can",
    "refuel",
    [
        "MtvrRefuel_DES_EP1",
        "UralRefuel_TK_EP1"
    ]
];

// Visibility in the dialog
GVAR(inventory_refuel_visible) = [
    QUOTE(THIS_MODULE),
    "ca\ui\data\ui_action_refuel_ca"
];

[GVAR(inventory_types), GVAR(inventory_refuel_type)] call BIS_fnc_arrayPush;
[GVAR(inventory_type_visible), GVAR(inventory_refuel_visible)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,valid),inventory\types\refuel\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;