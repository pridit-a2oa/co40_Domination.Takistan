/**
 * Idle Module
 *
 * Description: This module is responsible for ejecting players that are idle
 * from the world.
 */

#define THIS_MODULE idle
#include "x_macros.sqf"

// Set maximum amount of time (seconds) that a player can be idle.
GVAR(idle_time_static) = 3600;

// Set amount of time (seconds) to sleep before checking idle time.
GVAR(idle_time_sleep) = GVAR(idle_time_static) / 60;

MODULE(THIS_MODULE) = true;