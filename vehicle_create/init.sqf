/**
 * Vehicle Create Module
 */

#define THIS_MODULE vehicle_create
#include "x_macros.sqf"

// Set vehicle types possible of vehicle creation.
GVAR(vehicle_create_types) = [
    "BMP2_HQ_TK_EP1",
    "M1133_MEV_EP1"
];

// Set vehicle that should be produced in line with faction.
GVAR(vehicle_create_types_vehicle) = [
    ["BIS_TK", "TT650_TK_EP1"],
    ["BIS_US", "ATV_US_EP1"]
];

// Minimum distance all players must be before deletion can occur
GVAR(vehicle_distance) = 150;

__cppfln(FUNC(THIS_MODULE,spawn),THIS_MODULE\functions\fn_spawn.sqf);

MODULE(THIS_MODULE) = true;