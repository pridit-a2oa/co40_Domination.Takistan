/**
 * Base Protection Module
 *
 * Description: This module provides various facility in order to prevent
 * the main base area and assets therein from being abused.
 */

#define THIS_MODULE base_protection
#include "x_macros.sqf"

// Maximum distance from base for projectiles to be removed & vehicle invulnerability
GVAR(base_protection_distance) = 420;

// Types of hand fired projectiles to forbay firing within the base
GVAR(base_protection_projectiles_player) = [
    "HandGrenade",
    "HandGrenade_East",
    "MineE",
    "Mine",
    "PipeBomb"
];

// Types of vehicle projectiles to forbay firing within the base
GVAR(base_protection_projectiles_vehicle) = [
    "Bo_FAB_250",
    "Bo_GBU12_LGB",
    "Bo_GBU12_LGB_F35",
    "Bo_Mk82"
];

MODULE(THIS_MODULE) = true;