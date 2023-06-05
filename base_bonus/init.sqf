/**
 * Base Bonus Module
 *
 * Description: This module creates vehicles designated as bonus vehicles.
 */

#define THIS_MODULE base_bonus
#include "x_macros.sqf"

// Bonus vehicles to create (editor markers)
GVAR(base_bonus_amount) = 5;

if (isServer) then {
    X_JIPH setVariable [QGVAR(base_bonus), false, true];
};

MODULE(THIS_MODULE) = true;