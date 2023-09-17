/**
 * Event Module
 *
 * Description: Seed OPFOR events across the map (ignoring towns), and maintain
 * a minimum number of these.
 */

#define THIS_MODULE event
#include "x_macros.sqf"

// Minimum distance all players must be before cleaning a cleared event
GVAR(event_distance_cleanup) = 200;

// Minimum distance from any other player before creating event
GVAR(event_distance_create) = 1500;

// Time following completion before removing the existing creation and any orphans
GVAR(event_time_cleanup) = 600;

// Time following completion to delay next event generation
GVAR(event_time_delay) = 1800;

if (isServer) then {
    GVAR(event_types) = [];
};

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);

MODULE(THIS_MODULE) = true;