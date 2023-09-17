/**
 * Mission Mini Module
 *
 * Description: Manages handling of a small scope, untracked mission.
 */

#define THIS_MODULE mission_mini
#include "x_macros.sqf"

// Distance range from base a mini mission can generate between
GVAR(mission_mini_distance_base) = [1100, 2300];

// Minimum distance other players must be before cleaning
GVAR(mission_mini_distance_cleanup) = 200;

// Amount of time following completion to clean up remaining entities
GVAR(mission_mini_time_cleanup) = 600;

if (isServer) then {
    GVAR(mission_mini_types) = [];
};

__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,composition),THIS_MODULE\functions\fn_composition.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;