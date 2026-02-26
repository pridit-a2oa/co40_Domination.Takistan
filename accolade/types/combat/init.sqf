/**
 * Accolade - Combat Module
 */

#define THIS_MODULE accolade_combat
#include "x_macros.sqf"

if (isNil QMODULE(accolade)) exitWith {};

// Set discipline and unit
GVAR(accolade_combat_type) = [
    "combat",
    "Combat",
    "US_Soldier_Officer_EP1"
];

// Set animation(s) for unit to perform
GVAR(accolade_combat_animations) = [
    "sykes_c0briefing",
    true
];

// Set relative position and direction
GVAR(accolade_combat_location) = [
    [10.5, -4.5, -2],
    -90
];

// Set type, relative position (to unit) and direction of any objects
GVAR(accolade_combat_objects) = [
    ["Desk", [-0.9, 0, 0.1], 90],
    ["FoldChair", [0.15, 0, 0.1], 90]
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
        "Destroy a main target objective using an artillery salvo"
    ],
    [
        [
            "Complete optional main target objectives",
            [3, [11, "call d_fnc_statistic_get"]]
        ]
    ],
    [
        [
            "Accrue a total score of at least 1,000",
            [1000, [[], "500"]]
        ]
    ]
];

[GVAR(accolade_types), GVAR(accolade_combat_type)] call BIS_fnc_arrayPush;

if (isServer) then {
    [GVAR(accolade_defaults), [count GVAR(accolade_combat_tasks)] call FUNC(accolade,default)] call BIS_fnc_arrayPush;
};

MODULE(THIS_MODULE) = true;