/**
 * Vehicle Respawn Module
 *
 * Description: This modules handles respawning of designated vehicle types.
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"
private ["_tiny", "_short", "_medium", "_long", "_extreme"];

_tiny = 180;        // 3 minutes
_short = 900;       // 15 minutes
_medium = 1800;     // 30 minutes
_long = 3600;       // 60 minutes
_extreme = 5400;    // 90 minutes

// Minimum time before specified type of vehicle can be respawned (abandoned)
GVAR(vehicle_respawn_type_vehicles) = [
    [_tiny, "ATV_US_EP1"],
    [_short, "BAF_Offroad_D"],
    [_short, "HMMWV_DES_EP1"],
    [_short, "MH6J_EP1"],
    [_medium, "UH60M_EP1"],
    [_medium, "UH60M_MEV_EP1"],
    [_extreme, "BAF_Merlin_HC3_D"],
    [_extreme, "CH_47F_EP1"],
    [_extreme, "MV22"]
];

// Set maximum distance from base the vehicle can originate from to respawn
GVAR(vehicle_respawn_distance_base) = 400;

// Set minimum distance from closest player before respawning
GVAR(vehicle_respawn_distance_player) = 50;

// Set minimum time before a destroyed vehicle can respawn
GVAR(vehicle_respawn_time_expiration) = 30;

__cppfln(FUNC(THIS_MODULE,threshold),THIS_MODULE\functions\fn_threshold.sqf);

MODULE(THIS_MODULE) = true;