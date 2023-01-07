/**
 * Mission Side - Crash Module
 *
 * Description: This module is responsible for handling the side target mission
 * of crash landing event, in which a vehicle must be recovered.
 */

#define THIS_MODULE mission_side_crash
#include "x_macros.sqf"

// Aircraft type
GVAR(mission_crash_type_aircraft) = "C130J_US_EP1";

// Possible types of vehicles to be picked to recover
GVAR(mission_crash_types_vehicle) = [
    "BAF_FV510_D",
    "M1128_MGS_EP1",
    "MLRS_DES_EP1"
];

MODULE(THIS_MODULE) = true;