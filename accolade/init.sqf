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

// Set rank of NPC units
GVAR(accolade_type_rank) = "MAJOR";

// Set cooldown time between client actions triggering database calls
GVAR(accolade_time_cooldown) = 10;

if (hasInterface) then {
    player setVariable [QGVAR(experience), 0];
    player setVariable [QGVAR(tasks), []];

    if (isNil {player getVariable QGVAR(accolade_cooldown)}) then {
        player setVariable [QGVAR(accolade_cooldown), time + GVAR(accolade_time_cooldown)];
    };
};

if (isServer) then {
    X_JIP setVariable [QGVAR(accolades), [], true];
};

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,key),THIS_MODULE\functions\fn_key.sqf);
__cppfln(FUNC(THIS_MODULE,max),THIS_MODULE\functions\fn_max.sqf);
__cppfln(FUNC(THIS_MODULE,proficiency),THIS_MODULE\functions\fn_proficiency.sqf);
__cppfln(FUNC(THIS_MODULE,progress),THIS_MODULE\functions\fn_progress.sqf);
__cppfln(FUNC(THIS_MODULE,rank),THIS_MODULE\functions\fn_rank.sqf);
__cppfln(FUNC(THIS_MODULE,refresh),THIS_MODULE\functions\fn_refresh.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,state),THIS_MODULE\functions\fn_state.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,task),THIS_MODULE\functions\fn_task.sqf);
__cppfln(FUNC(THIS_MODULE,view),THIS_MODULE\functions\fn_view.sqf);

MODULE(THIS_MODULE) = true;