/**
 * Mission Main Module
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

// Set antenna (formerly radio tower) type
GVAR(mission_main_type_antenna) = "Land_Antenna";

// Set camp (composition) type
GVAR(mission_main_type_camp) = "Camp2_TK_EP1";

// Set possible optional task types
GVAR(mission_main_type_optional) = [
    ["aircraft factory",        ["object",  "TK_WarfareBAircraftFactory_Base_EP1"]],
    ["anti-air radar",          ["object",  "TK_WarfareBAntiAirRadar_Base_EP1"]],
    ["artillery radar",         ["object",  "TK_WarfareBArtilleryRadar_Base_EP1"]],
    ["barracks",                ["object",  "TK_WarfareBBarracks_Base_EP1"]],
    ["heavy factory",           ["object",  "TK_WarfareBHeavyFactory_Base_EP1"]],
    ["light factory",           ["object",  "TK_WarfareBLightFactory_base_EP1"]],
    ["HQ",                      ["object",  "BMP2_HQ_TK_unfolded_Base_EP1"]],
    ["high ranking officer",    ["unit",    "TK_Soldier_Officer_EP1"]]
];

// Set crewed object compositions
GVAR(mission_main_type_compositions) = [
    ["AntiAir1_TK_EP1",     2],
    ["Firebase1_TK_EP1",    2],
    ["FuelDump1_TK_EP1",    1]
];

// Set reinforcement types
GVAR(mission_main_type_reinforcements) = [
    ["aircraft", ["L39_TK_EP1", "Mi24_D_TK_EP1", "Su25_TK_EP1", "UH1H_TK_EP1"]],
    ["infantry", ["Mi17_TK_EP1"]]
];

// Set amount of antennas per target
GVAR(mission_main_amount_antennas) = 2;

// Set amount of camps per target
GVAR(mission_main_amount_camps) = 3;

// Set amount of optional objectives per main target
GVAR(mission_main_amount_optional) = 1;

// Set amount of main targets to initially seed
GVAR(mission_main_amount_targets) = 1;

// Set distance from base before a city can become a valid target
GVAR(mission_main_distance_base) = 2600;

// Set distance from flag (as part of a camp) before being able to capture
GVAR(mission_main_distance_camp) = 20;

// Set distance from north airfield before a city can become a valid target
GVAR(mission_main_distance_naf) = 1800;

// Set minimum distance for reinforcements to spawn in
GVAR(mission_main_distance_reinforcement) = 4000;

// Set the radius for the main target zone
GVAR(mission_main_radius_zone) = 400;

// Set amount of time to capture a camp
GVAR(mission_main_time_capture) = 30;

// Set amount of time (since seized) a main target is recycled back for use
GVAR(mission_main_time_recycle) = 5400;

// Set amount of time between reinforcements
GVAR(mission_main_time_reinforce) = 1200;

__cppfln(FUNC(THIS_MODULE,capture),THIS_MODULE\functions\fn_capture.sqf);
__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,reinforcement),THIS_MODULE\functions\fn_reinforcement.sqf);
__cppfln(FUNC(THIS_MODULE,recycle),THIS_MODULE\functions\fn_recycle.sqf);
__cppfln(FUNC(THIS_MODULE,remove),THIS_MODULE\functions\fn_remove.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,spotted),THIS_MODULE\functions\fn_spotted.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;