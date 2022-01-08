/**
 * Fortification Module
 */

#define THIS_MODULE fortification
#include "x_macros.sqf"

// Set the model
GVAR(fortification_type) = "Land_fort_rampart_EP1";

// Set rotation of the model in relation to the player to apply when constructed
GVAR(fortification_amount_rotation) = 0;

// Set time between constructing
GVAR(fortification_time_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(fortification), 0];
    player setVariable [QGVAR(fortification_max), 0];
    
    if (isNil {player getVariable QGVAR(fortification_time_cooldown)}) then {
        player setVariable [QGVAR(fortification_time_cooldown), time + GVAR(fortification_time_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;