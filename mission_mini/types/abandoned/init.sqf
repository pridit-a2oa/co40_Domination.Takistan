/**
 * Mission Mini - Abandoned Module
 *
 * Description: This module is responsible for handling the mini mission to
 * recover an abandoned light vehicle.
 */

#define THIS_MODULE mission_mini_abandoned
#include "x_macros.sqf"

// Add to the list of possible types of mini messions
GVAR(mission_mini_types) = GVAR(mission_mini_types) + [
    ["abandoned", "Abandoned Light Vehicle"]
];

// Possible types of vehicles to be picked to recover
GVAR(mission_mini_abandoned_types_vehicle) = [
    "BAF_Jackal2_L2A1_D",
    "BAF_Jackal2_L2A1_w",
    "HMMWV_M1151_M2_DES_EP1"
];

// Chance the vehicle will be flipped
GVAR(mission_mini_abandoned_chance_flip) = 40;

// Chance an IED will accompany the abandoned vehicle
GVAR(mission_mini_abandoned_chance_ied) = 65;

__cppfln(FUNC(THIS_MODULE,create),mission_mini\types\abandoned\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;