/**
 * Nest (MG) Module
 */

#define THIS_MODULE nest
#include "x_macros.sqf"

// Set the model
GVAR(nest_type) = "WarfareBMGNest_M240_US_EP1";

// Set rotation of the model in relation to the player to apply when constructed
GVAR(nest_amount_rotation) = 0;

// Set time between constructing
GVAR(nest_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(nest), 0];
    player setVariable [QGVAR(nest_max), 0];
    
    if (isNil {player getVariable QGVAR(nest_time_cooldown)}) then {
        player setVariable [QGVAR(nest_time_cooldown), time + GVAR(nest_time_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;