/**
 * Vehicle Create Module
 */

#define THIS_MODULE vehicle_create
#include "x_macros.sqf"

// Vehicle types possible of vehicle creation and what they can create
GVAR(vehicle_create_types) = [
    ["BMP2_HQ_TK_EP1",  ["TT650_TK_EP1"]],
    ["C130J_US_EP1",    ["HMMWV_DES_EP1", "MH6J_EP1"]],
    ["M1133_MEV_EP1",   ["ATV_US_EP1"]]
];

// Minimum distance all players must be before deletion can occur
GVAR(vehicle_distance) = 150;

__cppfln(FUNC(THIS_MODULE,spawn),THIS_MODULE\functions\fn_spawn.sqf);

MODULE(THIS_MODULE) = true;