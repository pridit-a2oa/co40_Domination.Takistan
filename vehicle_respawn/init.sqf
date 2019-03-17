/**
 * Vehicle Respawn Module
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"
private ["_tiny", "_short", "_medium", "_long", "_extreme"];

_tiny = 180;        // 3 minutes
_short = 600;       // 10 minutes
_medium = 1200;     // 20 minutes
_long = 3600;       // 60 minutes
_extreme = 5400;    // 90 minutes

// Maximum distance from base the vehicle can originate from
GVAR(respawnable_base_distance) = 400;

// Minimum time before a destroyed vehicle can respawn
GVAR(respawnable_expiration) = 30;

// Minimum time before a disabled, but alive vehicle, can respawn without
// an explicit respawnable_times set
GVAR(respawnable_threshold) = 120;

// Minimum time before specified type of vehicle can be respawned (abandoned)
GVAR(respawnable_times) = [
    [_tiny, "ATV_US_EP1"],
    [_short, "BAF_Offroad_D"],
    [_short, "HMMWV_DES_EP1"],
    [_medium, "MH6J_EP1"],
    [_medium, "UH1H_TK_GUE_EP1"],
    [_medium, "UH60M_MEV_EP1"],
    [_long, "C130J_US_EP1"],
    [_extreme, "CH_47F_EP1"],
    [_extreme, "BAF_Merlin_HC3_D"],
    [_extreme, "MV22"]
];

__cppfln(FUNC(THIS_MODULE,threshold),THIS_MODULE\functions\fn_threshold.sqf);

MODULE(THIS_MODULE) = true;