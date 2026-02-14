/**
 * Accolade - Combat Module
 */

#define THIS_MODULE accolade_combat
#include "x_macros.sqf"

// Set discipline and unit
GVAR(accolade_combat_type) = [
    "combat",
    "Combat",
    "US_Soldier_Officer_EP1"
];

// Set relative position and direction
GVAR(accolade_combat_location) = [
    [11, -5, -2],
    60
];

// Set tasks and additional (optional) item reward
GVAR(accolade_combat_tasks) = [
    [
        "Equip a backpack from the heap"
    ],
    [
        "Capture a camp within a main target",
        ["EvMap"]
    ],
    [
        "Complete an optional main target task"
    ],
    [
        ["Assist with seizing 3 main targets on foot", [3, -1]]
    ],
    [
        ["Accrue a total score of at least 1,000", 1000]
    ]
];

[GVAR(accolade_types), GVAR(accolade_combat_type)] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;