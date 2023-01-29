/**
 * Intel Module
 *
 * Description: This module facilitates players acquiring and redeeming an
 * intel item. This rewards score and triggers a mission mini [module].
 */

#define THIS_MODULE intel
#include "x_macros.sqf"

// The intel item that can be acquired
GVAR(intel_type_item) = "EvMap";

// Objects that can contain the intel item
GVAR(intel_type_objects) = [
    "Fort_Crate_wood"
];

// Score to reward when delivered
GVAR(intel_amount_score) = 10;

// Chance the gear item spawns on a given object
GVAR(intel_chance_spawn) = 5;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);
__cppfln(FUNC(THIS_MODULE,process),THIS_MODULE\functions\fn_process.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;