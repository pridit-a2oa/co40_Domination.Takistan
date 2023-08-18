/**
 * Item - Evidence Module
 */

#define THIS_MODULE item_evidence
#include "x_macros.sqf"

// Type, item, and parent object
GVAR(item_evidence_type) = ["Evidence", "EvMap", "Fort_Crate_wood"];

// Chance the item spawns on a parent object
GVAR(item_evidence_chance) = 5;

// Score to reward when delivered
GVAR(item_evidence_score) = 10;

[GVAR(item_types), GVAR(item_evidence_type)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,reward),item\types\evidence\functions\fn_reward.sqf);

MODULE(THIS_MODULE) = true;