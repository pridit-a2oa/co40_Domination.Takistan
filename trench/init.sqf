/**
 * Trench Module
 */

#define THIS_MODULE trench
#include "x_macros.sqf"

// Trench type
GVAR(trench_type) = "";

// Time between building
GVAR(trench_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(trench), 0];
    player setVariable [QGVAR(trench_max), 0];
    player setVariable [QGVAR(trench_cooldown), time + GVAR(trench_cooldown)];
};

MODULE(THIS_MODULE) = true;