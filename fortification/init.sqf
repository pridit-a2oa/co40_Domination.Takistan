/**
 * Fortification Module
 */

#define THIS_MODULE fortification
#include "x_macros.sqf"

// Fortification type
GVAR(fortification_type) = "Land_fort_rampart_EP1";

// Time between building
GVAR(fortification_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(fortification), 0];
    player setVariable [QGVAR(fortification_max), 0];
    
    if (isNil {player getVariable QGVAR(fortification_cooldown)}) then {
        player setVariable [QGVAR(fortification_cooldown), time + GVAR(fortification_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;