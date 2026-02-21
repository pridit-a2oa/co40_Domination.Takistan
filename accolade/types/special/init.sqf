/**
 * Accolade - Special Module
 */

#define THIS_MODULE accolade_special
#include "x_macros.sqf"

// Set discipline and unit
GVAR(accolade_special_type) = [
    "special",
    "Special Ops",
    "US_Delta_Force_Undercover_Takistani06_EP1"
];

// Set relative position and direction
GVAR(accolade_special_location) = [
    [11, -5, -2],
    60
];

// Set tasks and additional (optional) item reward
GVAR(accolade_special_tasks) = [
    [
        "Perform a HALO jump from the flag"
    ],
    [
        "Drag an unconscious squad member"
    ],
    [
        "Destroy a main target objective using an artillery salvo"
    ],
    [
        ["Eliminate 3 OPFOR roadblocks", [3, -1]]
    ],
    [
        ["Recover 8 evidence files", [8, -1]]
    ]
];

[GVAR(accolade_types), GVAR(accolade_special_type)] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;