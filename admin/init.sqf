/**
 * Admin Module
 *
 * Description: This module provides administrative abilities to a curated list
 * of players.
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

// UID of players that have access to administrative functions
GVAR(admin_type_players) = [
    // "ERROR",
    "_SP_PLAYER_",
    "76561197992228102"
];

MODULE(THIS_MODULE) = true;