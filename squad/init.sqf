/**
 * Squad Module
 *
 * Description: This module enables players to join & leave the squads of their
 * teammates as well as handling player group association.
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

// The default, joinable group names
GVAR(group_names) = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot"
];

// The group ids which will match Group as a string
GVAR(group_ids) = [];

{
    GVAR(group_ids) = GVAR(group_ids) + ["B " + _x];
} forEach GVAR(group_names);

if (isServer) then {
    X_JIPH setVariable [QGVAR(groups), [], true];
};

__cppfln(FUNC(THIS_MODULE,assign),THIS_MODULE\functions\fn_assign.sqf);
__cppfln(FUNC(THIS_MODULE,join),THIS_MODULE\functions\fn_join.sqf);
__cppfln(FUNC(THIS_MODULE,groups),THIS_MODULE\functions\fn_groups.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);

MODULE(THIS_MODULE) = true;