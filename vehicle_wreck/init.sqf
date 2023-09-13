/**
 * Vehicle Wreck Module
 *
 * Description: This module facilitates the creation of new wrecks.
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Chance that enemy aircraft can produce a wreck
GVAR(vehicle_wreck_chance_air) = 20;

// Chance that enemy armor can produce a wreck
GVAR(vehicle_wreck_chance_land) = 10;

// Amount of time since destruction to announce wreck availability
GVAR(vehicle_wreck_time_announce) = 10;

__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);

MODULE(THIS_MODULE) = true;