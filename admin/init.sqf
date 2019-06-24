/**
 * Admin Module
 *
 * Description: This module provides administrative abilities to a curated list
 * of players.
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

// Set players who have access to administrative functions
GVAR(admin_type_players) = [
    "76561197992228102" // Pridit
];

MODULE(THIS_MODULE) = true;