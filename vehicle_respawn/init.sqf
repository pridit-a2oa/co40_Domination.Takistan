/**
 * Vehicle Respawn Module
 *
 * Description: This modules handles respawning of designated vehicle types.
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"

// Minimum time before specified type of vehicle can be respawned (abandoned)
GVAR(vehicle_respawn_type_vehicles) = [
    [180, "ATV_US_EP1"],
    [600, "UH60M_MEV_EP1"],
    [900, "BAF_Offroad_D"],
    [900, "HMMWV_DES_EP1"],
    [900, "MH6J_EP1"],
    [1800, "HMMWV_Ambulance_DES_EP1"],
    [1800, "UH60M_EP1"],
    [5400, "BAF_Merlin_HC3_D"],
    [5400, "CH_47F_EP1"],
    [5400, "MV22"]
];

// Set maximum distance from base the vehicle can originate from to respawn
GVAR(vehicle_respawn_distance_base) = 400;

// Set minimum distance from closest player before respawning
GVAR(vehicle_respawn_distance_player) = 50;

// Set minimum time before a destroyed vehicle can respawn
GVAR(vehicle_respawn_time_expiration) = 30;

__cppfln(FUNC(THIS_MODULE,threshold),THIS_MODULE\functions\fn_threshold.sqf);

MODULE(THIS_MODULE) = true;