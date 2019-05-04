/**
 * Nest (MG) Module
 */

#define THIS_MODULE nest
#include "x_macros.sqf"

// Nest type
GVAR(nest_type) = "WarfareBMGNest_M240_US_EP1";

// Time between building
GVAR(nest_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(nest), 0];
    player setVariable [QGVAR(nest_max), 0];
    player setVariable [QGVAR(nest_cooldown), time + GVAR(nest_cooldown)];
};

MODULE(THIS_MODULE) = true;