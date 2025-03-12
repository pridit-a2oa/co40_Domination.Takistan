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
    "76561197992228102"
];

__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;