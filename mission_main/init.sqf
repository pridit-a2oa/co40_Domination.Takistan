/**
 * Mission Main Module
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

// Set antenna type
GVAR(mission_main_type_antenna) = "Land_Antenna";

// Set camp (composition) type
GVAR(mission_main_type_camp) = "Camp2_TK_EP1";

// Set reinforcement types
GVAR(mission_main_type_reinforcements) = [
    ["aircraft", ["L39_TK_EP1", "Mi24_D_TK_EP1", "Su25_TK_EP1", "UH1H_TK_EP1"]],
    ["infantry", ["Mi17_TK_EP1"]]
];

// Set amount of antennas per target
GVAR(mission_main_count_antennas) = 2;

// Set amount of camps per target
GVAR(mission_main_count_camps) = 3;

// Set distance from base before a city can become a valid target
GVAR(mission_main_distance_base) = 2600;

// Set distance from north airfield before a city can become a valid target
GVAR(mission_main_distance_naf) = 1800;

// Set amount of time (since capture) a main target is recycled back for use
GVAR(mission_main_time_recycle) = 5400;

// Set amount of time between reinforcements
GVAR(mission_main_time_reinforce) = 1200;

// Set minimum distance for reinforcements to spawn in
GVAR(mission_main_distance_reinforcement) = 4000;

__cppfln(FUNC(THIS_MODULE,capture),THIS_MODULE\functions\fn_capture.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,reinforcement),THIS_MODULE\functions\fn_reinforcement.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;