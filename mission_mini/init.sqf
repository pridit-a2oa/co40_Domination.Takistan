/**
 * Mission Mini Module
 *
 * Description: This module is responsible for the handling of a mini mission,
 * which should always be in relatively close proximity to the base. No support
 * for simultaneous due to possible conflicts with other modules
 * (intel unit spawning fsm) and basic clean-up script.
 */

#define THIS_MODULE mission_mini
#include "x_macros.sqf"

// Possible types of mini missions. Populated by missions themselves
GVAR(mission_mini_types) = [];

// The min & max distance from base a mini mission can generate between
GVAR(mission_mini_distance_base) = [1100, 2100];

// Amount of time following completion to clean up remaining entities
GVAR(mission_mini_time_cleanup) = 300;

if (isServer) then {
    GVAR(mission_mini_cleanup) = [];
};

__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;