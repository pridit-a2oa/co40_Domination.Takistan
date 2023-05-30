/**
 * Mission Main Module
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

// Camp (composition) type along with whether they should be unique
GVAR(mission_main_type_camps) = [
    ["Camp2_TK_EP1",            false],
    ["MediumTentCamp3_TK_EP1",  true]
];

// Radio tower type
GVAR(mission_main_type_radio) = "Land_radar_EP1";

// Town seed exceptions
GVAR(mission_main_type_exceptions) = [
    "Shamali"
];

// Possible optional task types
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

// Crewed object compositions along with amount and chance they will spawn
GVAR(mission_main_type_compositions) = [
    ["AntiAir1_TK_EP1", 2, 100],
    ["Firebase1_TK_EP1", 1, 100],
    ["FuelDump1_TK_EP1", 1, 50]
];

// List of projectiles to negate damage inflicted on objectives
GVAR(mission_main_type_projectiles) = [
    "Sh_81_HE",
    "Sh_122_HE"
];

// Reinforcement types
GVAR(mission_main_type_reinforcements) = [
    ["aircraft", ["L39_TK_EP1", "Mi24_D_TK_EP1", "Su25_TK_EP1", "UH1H_TK_EP1"]],
    ["infantry", ["Mi17_TK_EP1"]]
];

// Type of units that will be seeded along with amount
GVAR(mission_main_type_units) = [
    ["infantry",    6],
    ["light",       4],
    ["apc",         4],
    ["tank",        3]
];

// Amount of camps per target
GVAR(mission_main_amount_camps) = 3;

// Amount of score to reward players capturing a camp upon capture
GVAR(mission_main_amount_camps_score) = 3;

// Amount of optional objectives per main target
GVAR(mission_main_amount_optional) = 1;

// Amount of radio towers per target
GVAR(mission_main_amount_radios) = 2;

// Amount of main targets to initially seed
GVAR(mission_main_amount_targets) = 1;

// Distance from base before a city can become a valid target
GVAR(mission_main_distance_base) = 2600;

// Distance from flag (as part of a camp) before being able to capture
GVAR(mission_main_distance_camp) = 20;

// Minimum distance from current target location a new target location must be
GVAR(mission_main_distance_location) = 2600;

// Minimum distance any player has to be from a location before eligible as a target
GVAR(mission_main_distance_player) = 1000;

// Minimum distance for reinforcements to spawn in
GVAR(mission_main_distance_reinforcement) = 4000;

// The divisor to determine location repetition based on total amount of main targets in circulation
GVAR(mission_main_location_divisor) = 2;

// The radius for the main target zone
GVAR(mission_main_radius_zone) = 500;

// Amount of time to capture a camp
GVAR(mission_main_time_capture) = 45;

// Amount of time before clearing remaining threats once target is complete
GVAR(mission_main_time_clear) = 600;

// The amount of time once meeting the completion criteria to announce
GVAR(mission_main_time_complete) = 30;

// Amount of time to sleep before generating a target
GVAR(mission_main_time_delay) = 40;

// Amount of time (since seized) a main target is recycled back for use. Combines with clear time
GVAR(mission_main_time_recycle) = 3600;

// Amount of time between reinforcements
GVAR(mission_main_time_reinforce) = 1200;

// Maximum amount of active armor before considering completion
GVAR(mission_main_threshold_armor) = 1;

// Maximum amount of active infantry before considering completion
GVAR(mission_main_threshold_infantry) = 3;

if (isServer) then {
    GVAR(mission_main_targets) = [];
    GVAR(mission_main_targets_completed) = [];
};

__cppfln(FUNC(THIS_MODULE,capture),THIS_MODULE\functions\fn_capture.sqf);
__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,detected),THIS_MODULE\functions\fn_detected.sqf);
__cppfln(FUNC(THIS_MODULE,exists),THIS_MODULE\functions\fn_exists.sqf);
__cppfln(FUNC(THIS_MODULE,kill),THIS_MODULE\functions\fn_kill.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,protect),THIS_MODULE\functions\fn_protect.sqf);
__cppfln(FUNC(THIS_MODULE,reinforcement),THIS_MODULE\functions\fn_reinforcement.sqf);
__cppfln(FUNC(THIS_MODULE,recycle),THIS_MODULE\functions\fn_recycle.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;