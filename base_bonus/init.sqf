/**
 * Base Bonus Module
 *
 * Description: This module seeds vehicles designated as bonus vehicles.
 */

#define THIS_MODULE base_bonus
#include "x_macros.sqf"

// Set amount of bonus vehicles to seed
GVAR(base_bonus_amount) = 5;

MODULE(THIS_MODULE) = true;