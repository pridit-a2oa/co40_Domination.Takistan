/**
 * Accolade - Engineer Module
 */

#define THIS_MODULE accolade_engineer
#include "x_macros.sqf"

// Set discipline and unit
GVAR(accolade_engineer_type) = [
    "engineer",
    "Engineering",
    "US_Delta_Force_EP1"
];

// Set animation(s) for unit to perform
GVAR(accolade_engineer_animations) = [
    "RepairingKneel",
    true
];

// Set relative position and direction
GVAR(accolade_engineer_location) = [
    [-9, 2.5, 0.5],
    -90
];

// Set type and relative position and direction of any objects
GVAR(accolade_engineer_objects) = [
    ["Land_Antenna", [-0.6, -0.1, 0], 0]
];

// Set tasks and additional (optional) item reward
GVAR(accolade_engineer_tasks) = [
    [
        "Service a vehicle at a service point"
    ],
    [
        "Create a vehicle from a deployed MHQ or FOB"
    ],
    [
        "Fast travel to or respawn at a deployed BMP-2 (HQ)"
    ],
    [
        [
            "Defuse roadside IEDs",
            [4, [4, "call d_fnc_statistic_get"]]
        ]
    ],
    [
        [
            "Deconstruct OPFOR vehicles",
            [6, [9, "call d_fnc_statistic_get"]]
        ]
    ]
];

[GVAR(accolade_types), GVAR(accolade_engineer_type)] call BIS_fnc_arrayPush;

if (isServer) then {
    [GVAR(accolade_defaults), [count GVAR(accolade_engineer_tasks)] call FUNC(accolade,default)] call BIS_fnc_arrayPush;
};

MODULE(THIS_MODULE) = true;