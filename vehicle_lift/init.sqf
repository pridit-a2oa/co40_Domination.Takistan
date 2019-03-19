/**
 * Vehicle Lift Module
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"

// Set vehicle(s) as lift types
GVAR(vehicle_lift_types) = [
    "CH_47F_EP1",
    "BAF_Merlin_HC3_D",
    "MV22"
];

MODULE(THIS_MODULE) = true;