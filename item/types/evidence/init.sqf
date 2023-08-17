/**
 * Item - Evidence Module
 */

#define THIS_MODULE item_evidence
#include "x_macros.sqf"

// Add type, item, & parent object to item types
[GVAR(item_types),
    ["Evidence", "EvMap", "Fort_Crate_wood"]
] call BIS_fnc_arrayPush;

// Chance the item spawns on a given object
GVAR(item_evidence_chance) = 10;

MODULE(THIS_MODULE) = true;