/**
 * Vehicle Lift Module
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"

// Set vehicle(s) as lift types
GVAR(vehicle_lift_types) = [
    "BAF_Merlin_HC3_D",
    "CH_47F_EP1",
    "Mi17_TK_EP1",
    "MV22"
];

MODULE(THIS_MODULE) = true;