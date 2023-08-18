/**
 * Item - Money Module
 */

#define THIS_MODULE item_money
#include "x_macros.sqf"

// Type, item, and parent object
GVAR(item_money_type) = ["Money", "EvMoney", "FoldTable"];

// Chance the item spawns on a parent object
GVAR(item_money_chance) = 15;

[GVAR(item_types), GVAR(item_money_type)] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;