/**
 * Intel Module
 *
 * Description: This module spawns in a civilian AI unit that will make their
 * way to base to provide players with intel (mini mission) or a car bomb.
 */

#define THIS_MODULE intel
#include "x_macros.sqf"

// Set the civilian vehicle type
GVAR(intel_type_vehicles) = [
    "Volha_1_TK_CIV_EP1",
    "Volha_2_TK_CIV_EP1"
];

// Set the variation in mini missions that can be given
GVAR(intel_type_targets) = [
    "enemy encampment", 
    "abandoned light vehicle"
];

// Set the bomb type
GVAR(intel_type_bomb) = "ARTY_Sh_81_HE";

// Set chance that intel will be a car bomb
GVAR(intel_chance_bomb) = 30;

// Set distance from the intel point to spawn in civilian unit
GVAR(intel_distance_spawn) = 1300;

// Set time between spawning units that can provide intel
GVAR(intel_time_spawn) = 30;

if (isServer) then {
    X_JIPH setVariable [QGVAR(intel), false, true];
};

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,explode),THIS_MODULE\functions\fn_explode.sqf);
__cppfln(FUNC(THIS_MODULE,intel),THIS_MODULE\functions\fn_intel.sqf);
__cppfln(FUNC(THIS_MODULE,target),THIS_MODULE\functions\fn_target.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;