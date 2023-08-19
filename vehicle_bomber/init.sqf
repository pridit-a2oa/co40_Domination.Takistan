/**
 * Vehicle Bomber Module
 *
 * Description: This module spawns in a civilian AI unit that will make their
 * way to base to provide players with a mission mini [module] or explode.
 */

#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"

// The civilian vehicle type
GVAR(vehicle_bomber_type_vehicles) = [
    "Lada1_TK_CIV_EP1",
    "S1203_TK_CIV_EP1",
    "Volha_1_TK_CIV_EP1",
    "Volha_2_TK_CIV_EP1"
];

// The bomb type
GVAR(vehicle_bomber_type_bomb) = "ARTY_Sh_81_HE";

// Amount of score to reward when preventing a bombing
GVAR(vehicle_bomber_amount_score) = 3;

// Chance unit will detonate
GVAR(vehicle_bomber_chance_detonate) = 30;

// Chance unit will be playing music
GVAR(vehicle_bomber_chance_music) = 40;

// Distance from the marker to spawn in unit
GVAR(vehicle_bomber_distance_spawn) = 1300;

// Time between spawning units
GVAR(vehicle_bomber_time_spawn) = 3600;

if (isServer) then {
    gameLogic setVariable [QGVAR(bomber), false, true];
};

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,detonate),THIS_MODULE\functions\fn_detonate.sqf);
__cppfln(FUNC(THIS_MODULE,intel),THIS_MODULE\functions\fn_intel.sqf);
__cppfln(FUNC(THIS_MODULE,remove),THIS_MODULE\functions\fn_remove.sqf);
__cppfln(FUNC(THIS_MODULE,timer),THIS_MODULE\functions\fn_timer.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;