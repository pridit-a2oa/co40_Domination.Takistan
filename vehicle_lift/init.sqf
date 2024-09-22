/**
 * Vehicle Lift Module
 *
 * Description: This module enables players to physically attach vehicles
 * to aircraft designated as lifts.
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"

// Vehicles able to lift other vehicles alongside types & alive state
GVAR(vehicle_lift_types) = [
    ["Vehicle (not wreck)",
        [
            "BAF_Merlin_HC3_D",
            "CH_47F_EP1",
            "Mi17_TK_EP1"
        ],
        [
            "Car",
            "Plane",
            "Tank"
        ],
        true
    ],

    ["Wreck",
        [
            "UH60M_MEV_EP1"
        ],
        [
            "Air",
            "Car",
            "Tank"
        ],
        false
    ]
];

// Time between clients performing lift & release actions
GVAR(vehicle_lift_cooldown) = 5;

// Maximum distance from a liftable vehicle to lift
GVAR(vehicle_lift_distance) = 18;

// Maximum height from the ground to release
GVAR(vehicle_lift_height) = 17;

// Maximum speed to be able to lift
GVAR(vehicle_lift_speed) = 15;

if (hasInterface) then {
    uiNamespace setVariable ["X_VEHICLE_LIFT_DIALOG", displayNull];

    player setVariable [QGVAR(vehicle_lift_cooldown), time + GVAR(vehicle_lift_cooldown)];
};

__cppfln(FUNC(THIS_MODULE,attach),THIS_MODULE\functions\fn_attach.sqf);
__cppfln(FUNC(THIS_MODULE,detach),THIS_MODULE\functions\fn_detach.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;