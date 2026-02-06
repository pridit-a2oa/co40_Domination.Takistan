/**
 * Accolade - Combat Module
 */

#define THIS_MODULE accolade_combat
#include "x_macros.sqf"

[GVAR(accolade_types), "Combat"] call BIS_fnc_arrayPush;

// Set name
GVAR(accolade_combat_name) = "Combat";

// Set unit
GVAR(accolade_combat_unit) = "US_Soldier_MG_EP1";

// Set relative position and direction
GVAR(accolade_combat_location) = [
    [11, -5, -2],
    60
];

// Set tasks, persistency, and additional (optional) reward
GVAR(accolade_combat_tasks) = [
    [
        "Equip a backpack from the heap",
        false,
        []
    ],
    [
        "Capture a main target camp",
        false,
        ["EvMap"]
    ],
    [
        "Complete an optional main target task",
        false,
        []
    ],
    [
        ["Assist with seizing 3 main targets on foot", 3],
        true,
        []
    ],
    [
        ["Accrue a total score of at least 1,000", 1000],
        true,
        []
    ]
];

MODULE(THIS_MODULE) = true;