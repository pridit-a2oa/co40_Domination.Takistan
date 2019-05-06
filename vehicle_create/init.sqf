/**
 * Vehicle Create Module
 */

#define THIS_MODULE vehicle_create
#include "x_macros.sqf"

// Set vehicle types possible of vehicle creation
GVAR(vehicle_create_types) = [
    "M1133_MEV_EP1"
];

// Minimum distance all players must be before deletion can occur
GVAR(vehicle_distance) = 150;

__cppfln(FUNC(THIS_MODULE,atv),THIS_MODULE\functions\fn_atv.sqf);

MODULE(THIS_MODULE) = true;