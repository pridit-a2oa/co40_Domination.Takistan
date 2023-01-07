/**
 * Vehicle Wreck Module
 *
 * Description: This module handles the creation of wrecks and facilitation
 * of physically lifting them.
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Vehicles capable of lifting wrecks
GVAR(vehicle_wreck_type_lifts) = [
    "UH60M_MEV_EP1"
];

// Chance that enemy aircraft can produce a wreck
GVAR(vehicle_wreck_chance_air) = 20;

// Chance that enemy armor can produce a wreck
GVAR(vehicle_wreck_chance_land) = 10;

// Amount of time since destruction to announce wreck availability
GVAR(vehicle_wreck_time_announce) = 10;

__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);

MODULE(THIS_MODULE) = true;