/**
 * Accolade Module
 *
 * Description: This module facilitates a base structure (building
 * replacement), XP system, and NPC task givers (database required).
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"

// Set rank and XP requirement (toUpper when setUnitRank)
GVAR(accolade_types_rank) = [
    ["Private",     0],
    ["Corporal",    50],
    ["Sergeant",    140],
    ["Lieutenant",  260],
    ["Captain",     430],
    ["Major",       670],
    ["Colonel",     1000]
];

// Set XP scale for task completion
GVAR(accolade_amount_xp) = [
    0,
    25,
    50,
    75,
    100
];

if (hasInterface) then {
    player setVariable [QGVAR(experience), 0];
};

if (isServer) then {
    GVAR(accolade_types) = [];
};

__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);

MODULE(THIS_MODULE) = true;