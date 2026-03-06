/**
 * Investigation Module
 *
 * Description: Manages handling of a small scope, untracked mission.
 */

#define THIS_MODULE investigation
#include "x_macros.sqf"

// Distance range from base an investigation can generate between
GVAR(investigation_distance_base) = [1100, 2300];

// Minimum distance other players must be before cleaning
GVAR(investigation_distance_cleanup) = 200;

// Amount of time following completion to clean up remaining entities
GVAR(investigation_time_cleanup) = 600;

if (isServer) then {
    GVAR(investigation_types) = [];
};

__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,composition),THIS_MODULE\functions\fn_composition.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;