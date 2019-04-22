/**
 * Inventory Module - Vehicle Service Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

GVAR(inventory_types) = GVAR(inventory_types) + ["repair_kits"];

[nil, player, "per", rAddAction, "Give Repair Kit" call FUNC(common,OliveText), __function(transfer), "repair_kits", 10, false, true, "", "['repair_kits', _target] call d_fnc_inventory_valid"] call RE;