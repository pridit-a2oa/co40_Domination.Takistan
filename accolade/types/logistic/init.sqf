/**
 * Accolade - Logistic Module
 */

#define THIS_MODULE accolade_logistic
#include "x_macros.sqf"

// Set discipline and unit
GVAR(accolade_logistic_type) = [
    "logistic",
    "Logistics",
    "US_Soldier_Pilot_EP1"
];

// Set animation(s) for unit to perform
GVAR(accolade_logistic_animations) = [
    "TowingTractorSupport",
    true
];

// Set relative position and direction
GVAR(accolade_logistic_location) = [
    [0.5, 6, -4.5],
    90
];

// Set type and relative position and direction of any objects
GVAR(accolade_logistic_objects) = [
    ["Fort_Crate_wood", [1, -0.1, 0.12], 0]
];

// Set tasks and additional (optional) item reward
GVAR(accolade_logistic_tasks) = [
    [
        "Lift a vehicle using a vehicle lifter"
    ],
    [
        "Interact with a visiting civilian vehicle",
        ["EvMoney"]
    ],
    [
        "Recover an OPFOR attack aircraft wreck"
    ],
    [
        [
            "Unlock every eligible perk",
            [15, [[], "call d_fnc_perk_count"]]
        ]
    ],
    [
        [
            "Call in crossroad perks (e.g. airdrop, artillery, uav)",
            [25, [2, "call d_fnc_statistic_get"]]
        ]
    ]
];

[GVAR(accolade_types), GVAR(accolade_logistic_type)] call BIS_fnc_arrayPush;

if (isServer) then {
    [GVAR(accolade_defaults), [count GVAR(accolade_logistic_tasks)] call FUNC(accolade,default)] call BIS_fnc_arrayPush;
};

MODULE(THIS_MODULE) = true;