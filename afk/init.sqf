/**
 * AFK Module
 *
 * Description: This module is responsible for ejecting players that are idle
 * from the world.
 */

#define THIS_MODULE afk
#include "x_macros.sqf"

// Set maximum amount of time (seconds) that a player can be idle.
GVAR(afk_time_idle) = 3600;

// Set amount of time (seconds) to sleep before checking idle time.
GVAR(afk_time_sleep) = GVAR(afk_time_idle) / 60;

MODULE(THIS_MODULE) = true;