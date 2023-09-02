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
    ["Vehicles (not wrecks)",
        [
            "BAF_Merlin_HC3_D",
            "CH_47F_EP1",
            "Mi17_TK_EP1"
        ],
        [
            "LandVehicle",
            "Plane"
        ],
        true
    ],

    ["Wrecks",
        [
            "UH60M_MEV_EP1"
        ],
        [
            "Air",
            "LandVehicle"
        ],
        false
    ]
];

// Time between clients performing lift & release actions
GVAR(vehicle_lift_cooldown) = 5;

// Maximum distance from a liftable vehicle to lift
GVAR(vehicle_lift_distance) = 15;

// Maximum speed to be able to lift
GVAR(vehicle_lift_speed) = 10;

// Maximum height from the ground to release
GVAR(vehicle_lift_height) = 17;

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_lift_cooldown), time + GVAR(vehicle_lift_cooldown)];
};

__cppfln(FUNC(THIS_MODULE,attach),THIS_MODULE\functions\fn_attach.sqf);
__cppfln(FUNC(THIS_MODULE,detach),THIS_MODULE\functions\fn_detach.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;