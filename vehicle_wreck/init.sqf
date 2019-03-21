/**
 * Vehicle Wreck Module
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Set vehicle wreck
GVAR(vehicle_wreck_types) = [
    "UH60M_MEV_EP1"
];

if (isServer) then {
    //
};

if (hasInterface) then {
    //
};

MODULE(THIS_MODULE) = true;