/**
 * Inventory Module - Medical Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

[nil, player, "per", rAddAction, "Give Medkit" call FUNC(common,OliveText), __function(transfer), "medkits", 8, false, true, "", "['medkits', _target] call d_fnc_inventory_valid && {lifeState _target != 'UNCONSCIOUS'}"] call RE;