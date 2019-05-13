/**
 * MASH Module
 */

#define THIS_MODULE mash
#include "x_macros.sqf"

// MASH type
GVAR(mash_type) = "MASH_EP1";

// Time between building
GVAR(mash_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(mash), 0];
    player setVariable [QGVAR(mash_max), 0];
    
    if (isNil {player getVariable QGVAR(mash_cooldown)}) then {
        player setVariable [QGVAR(mash_cooldown), time + GVAR(mash_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;