/**
 * Accolade Module
 *
 * Description: This module facilitates a base structure (building
 * replacement), XP system, and NPC task givers (database required).
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"

GVAR(accolade_types) = [];

// Set rank and XP requirement
GVAR(accolade_types_rank) = [
    ["Private",     0],
    ["Corporal",    50],
    ["Sergeant",    140],
    ["Lieutenant",  260],
    ["Captain",     430],
    ["Major",       670],
    ["Colonel",     1000]
];

// Set proficiencies and XP reward
GVAR(accolade_types_proficiency) = [
    ["Entry",        0],
    ["Novice",       25],
    ["Intermediate", 50],
    ["Advanced",     75],
    ["Expert",       100],
    ["Master",       -1]
];

if (hasInterface) then {
    player setVariable [QGVAR(experience), 0];
};

if (isServer) then {
    X_JIP setVariable [QGVAR(accolade_units), [], true];
};

__cppfln(FUNC(THIS_MODULE,rank),THIS_MODULE\functions\fn_rank.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,view),THIS_MODULE\functions\fn_view.sqf);

MODULE(THIS_MODULE) = true;