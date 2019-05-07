/**
 * Inventory Module - Vehicle Repair Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

[nil, player, "per", rAddAction, "Give Repair Kit" call FUNC(common,OliveText), __function(transfer), "repair_kits", 8, false, true, "", "['repair_kits', _target] call d_fnc_inventory_valid && {lifeState _target != 'UNCONSCIOUS'}"] call RE;