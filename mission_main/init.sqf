/**
 * Mission Main Module
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

// Minimum distance from base before a city can become a valid target
GVAR(mission_main_distance_base) = 2600;

// Minimum distance from north airfield before a city can become a valid target
GVAR(mission_main_distance_naf) = 1800;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);

MODULE(THIS_MODULE) = true;