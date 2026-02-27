/**
 * Accolade - Special Module
 */

#define THIS_MODULE accolade_special
#include "x_macros.sqf"

if (isNil QMODULE(accolade)) exitWith {};

// Set discipline and unit
GVAR(accolade_special_type) = [
    "special",
    "Special Ops",
    "US_Delta_Force_Undercover_Takistani06_EP1"
];

// Set animation(s) for unit to perform
GVAR(accolade_special_animations) = [
    "LHD_krajPaluby",
    true
];

// Set relative position and direction
GVAR(accolade_special_location) = [
    [0, 1, 6.2],
    0
];

// Set type and relative position and direction of any objects
GVAR(accolade_special_objects) = [];

// Set tasks and additional (optional) item reward
GVAR(accolade_special_tasks) = [
    [
        "Perform a HALO jump from the flag"
    ],
    [
        "Discover an intelligence file in the field"
    ],
    [
        "Assassinate a high ranking officer on foot"
    ],
    [
        [
            "Eliminate OPFOR roadblocks",
            [4, [12, "call d_fnc_statistic_get"]]
        ]
    ],
    [
        [
            "Retrieve intelligence files",
            [8, [6, "call d_fnc_statistic_get"]]
        ]
    ]
];

[GVAR(accolade_types), GVAR(accolade_special_type)] call BIS_fnc_arrayPush;

if (isServer) then {
    [GVAR(accolade_defaults), [count GVAR(accolade_special_tasks)] call FUNC(accolade,default)] call BIS_fnc_arrayPush;
};

MODULE(THIS_MODULE) = true;