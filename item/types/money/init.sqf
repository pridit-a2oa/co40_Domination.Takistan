/**
 * Item - Money Module
 */

#define THIS_MODULE item_money
#include "x_macros.sqf"

// Add type, item, & parent object to item types
[GVAR(item_types), 
    ["Money", "EvMoney", "FoldTable"]
] call BIS_fnc_arrayPush;

// Chance the item spawns on a given object
GVAR(item_money_chance) = 15;

MODULE(THIS_MODULE) = true;