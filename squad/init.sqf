/**
 * Squad Module
 *
 * Description: This module enables players to join & leave the squads of their
 * teammates.
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

// Set the available group names
GVAR(group_names) = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot"
];

__cppfln(FUNC(THIS_MODULE,assign),THIS_MODULE\functions\fn_assign.sqf);
__cppfln(FUNC(THIS_MODULE,join),THIS_MODULE\functions\fn_join.sqf);
__cppfln(FUNC(THIS_MODULE,groups),THIS_MODULE\functions\fn_groups.sqf);

MODULE(THIS_MODULE) = true;