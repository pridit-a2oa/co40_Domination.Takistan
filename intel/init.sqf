/**
 * Intel Module
 *
 * Description: This module spawns in a civilian AI unit that will make their
 * way to base to provide players with intel (mini mission) or a car bomb.
 */

#define THIS_MODULE intel
#include "x_macros.sqf"

// Set the civilian vehicle type.
GVAR(intel_type_vehicles) = [
    "Lada1_TK_CIV_EP1",
    "Volha_1_TK_CIV_EP1",
    "Volha_2_TK_CIV_EP1"
];

// Set the bomb type.
GVAR(intel_type_bomb) = "ARTY_Sh_81_HE";

// Set chance that intel will be a car bomb.
GVAR(intel_chance_bomb) = 30;

// Set chance unit will be playing music.
// GVAR(intel_chance_music) = 35;

// Set distance from the intel point to spawn in unit.
GVAR(intel_distance_spawn) = 1300;

// Set amount of score to deduct for killing a civilian.
GVAR(intel_amount_score) = 10;

// Set time between spawning units that can provide intel.
GVAR(intel_time_spawn) = 3600;

if (isServer) then {
    gameLogic setVariable [QGVAR(intel), false, true];
};

__cppfln(FUNC(THIS_MODULE,alive),THIS_MODULE\functions\fn_alive.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,detonate),THIS_MODULE\functions\fn_detonate.sqf);
__cppfln(FUNC(THIS_MODULE,intel),THIS_MODULE\functions\fn_intel.sqf);
__cppfln(FUNC(THIS_MODULE,remove),THIS_MODULE\functions\fn_remove.sqf);
__cppfln(FUNC(THIS_MODULE,timer),THIS_MODULE\functions\fn_timer.sqf);

MODULE(THIS_MODULE) = true;