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

// Set relative position and direction
GVAR(accolade_engineer_location) = [
    [11, -5, -2],
    60
];

// Set tasks and additional (optional) item reward
GVAR(accolade_engineer_tasks) = [
    [
        "Service a vehicle at a service point"
    ],
    [
        "Construct a vehicle from a deployed MHQ or FOB"
    ],
    [
        "Reconstruct an OPFOR attack aircraft wreck"
    ],
    [
        ["Disarm 4 IEDs", [4, -1]]
    ],
    [
        ["Deconstruct 8 OPFOR vehicles", [8, -1]]
    ]
];

[GVAR(accolade_types), GVAR(accolade_engineer_type)] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;