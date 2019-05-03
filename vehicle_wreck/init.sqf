/**
 * Vehicle Wreck Module
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Set vehicle wreck
GVAR(vehicle_wreck_types) = [
    "UH60M_MEV_EP1"
];

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_wreck_enemy), false];
};

MODULE(THIS_MODULE) = true;