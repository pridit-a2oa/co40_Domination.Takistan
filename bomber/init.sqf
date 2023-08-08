/**
 * Bomber Module
 *
 * Description: This module spawns in a civilian AI unit that will make their
 * way to base to provide players with a mission mini [module] or explode.
 */

#define THIS_MODULE bomber
#include "x_macros.sqf"

// The civilian vehicle type
GVAR(bomber_type_vehicles) = [
    "Lada1_TK_CIV_EP1",
    "Volha_1_TK_CIV_EP1",
    "Volha_2_TK_CIV_EP1"
];

// The bomb type
GVAR(bomber_type_bomb) = "ARTY_Sh_81_HE";

// Amount of score to reward when preventing a bombing
GVAR(bomber_amount_score) = 3;

// Chance unit will detonate
GVAR(bomber_chance_detonate) = 30;

// Chance unit will be playing music
GVAR(bomber_chance_music) = 40;

// Distance from the marker to spawn in unit
GVAR(bomber_distance_spawn) = 1300;

// Time between spawning units
GVAR(bomber_time_spawn) = 3600;

if (isServer) then {
    gameLogic setVariable [QGVAR(bomber), false, true];
};

__cppfln(FUNC(THIS_MODULE,alive),THIS_MODULE\functions\fn_alive.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,detonate),THIS_MODULE\functions\fn_detonate.sqf);
__cppfln(FUNC(THIS_MODULE,intel),THIS_MODULE\functions\fn_intel.sqf);
__cppfln(FUNC(THIS_MODULE,remove),THIS_MODULE\functions\fn_remove.sqf);
__cppfln(FUNC(THIS_MODULE,timer),THIS_MODULE\functions\fn_timer.sqf);

MODULE(THIS_MODULE) = true;