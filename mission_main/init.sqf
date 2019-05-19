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
    "aircraft",
    "infantry"
];

// Set minimum amount of antennas a main target should have
GVAR(mission_main_count_antennas) = 2;

// Set minimum amount of camps a main target should have
GVAR(mission_main_count_camps) = 3;

// Set distance from base before a city can become a valid target
GVAR(mission_main_distance_base) = 2600;

// Set distance from north airfield before a city can become a valid target
GVAR(mission_main_distance_naf) = 1800;

__cppfln(FUNC(THIS_MODULE,capture),THIS_MODULE\functions\fn_capture.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,reinforcement),THIS_MODULE\functions\fn_reinforcement.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;