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

// Set relative position and direction
GVAR(accolade_logistic_location) = [
    [11, -5, -2],
    60
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
        "Fast travel to or respawn at a deployed BMP-2 (HQ)"
    ],
    [
        ["Unlock every perk", [15, "count (player getVariable ""d_perks_unlocked"")"]]
    ],
    [
        ["Call in 40 crossroad perks (e.g. airdrop, uav)", [40, -1]]
    ]
];

[GVAR(accolade_types), GVAR(accolade_logistic_type)] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;