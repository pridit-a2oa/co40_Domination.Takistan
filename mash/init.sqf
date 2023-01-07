/**
 * MASH Module
 */

#define THIS_MODULE mash
#include "x_macros.sqf"

// The model
GVAR(mash_type) = "MASH_EP1";

// Rotation of the model in relation to the player to apply when constructed
GVAR(mash_amount_rotation) = 180;

// Time between constructing
GVAR(mash_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(mash), 0];
    player setVariable [QGVAR(mash_max), 0];
    
    if (isNil {player getVariable QGVAR(mash_time_cooldown)}) then {
        player setVariable [QGVAR(mash_time_cooldown), time + GVAR(mash_time_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;