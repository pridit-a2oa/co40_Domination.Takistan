/**
 * Idle Module
 *
 * Description: This module is responsible for ejecting players that are idle
 * from the world.
 */

#define THIS_MODULE idle
#include "x_macros.sqf"

// Maximum amount of time (seconds) that a player can be idle
GVAR(idle_time_static) = 3600;

MODULE(THIS_MODULE) = true;