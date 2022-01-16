/**
 * Base Protect Module
 *
 * Description: This module provides various facility in order to prevent
 * the main base area from being abused.
 */

#define THIS_MODULE base_protect
#include "x_macros.sqf"

// Set maximum distance from base for projectiles to be removed.
GVAR(base_protect_distance) = 500;

// Set types of hand fired projectiles to forbay firing within the base.
GVAR(base_protect_projectiles_player) = [
    "HandGrenade",
    "HandGrenade_East",
    "MineE",
    "Mine",
    "PipeBomb"
];

// Set types of vehicle projectiles to forbay firing within the base.
GVAR(base_protect_projectiles_vehicle) = [
    "Bo_FAB_250",
    "Bo_GBU12_LGB",
    "Bo_GBU12_LGB_F35"
];

MODULE(THIS_MODULE) = true;