/**
 * Inventory Module - Medical Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

GVAR(inventory_types) = GVAR(inventory_types) + ["medkits"];

[nil, player, "per", rAddAction, "Give Medkit" call FUNC(common,OliveText), __function(transfer), "medkits", 9, false, true, "", "['medkits', _target] call d_fnc_inventory_valid"] call RE;