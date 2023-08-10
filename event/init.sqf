/**
 * Event Module
 *
 * Description: Seed OPFOR events across the map (ignoring towns), and maintain
 * a minimum number of these.
 */

#define THIS_MODULE event
#include "x_macros.sqf"

// Valid types
GVAR(event_types) = [];

// Minimum distance all players must be before cleaning a cleared event
GVAR(event_distance_cleanup) = 1000;

// Minimum distance from any other player before creating event
GVAR(event_distance_create) = 2000;

// Time of delay following an event clearing to process cleanup
GVAR(event_time_cleanup) = 600;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);

MODULE(THIS_MODULE) = true;