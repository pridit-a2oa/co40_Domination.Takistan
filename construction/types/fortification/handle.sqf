/**
 * Construction - Fortification Module (Handler)
 */

#include "x_macros.sqf"

// Time between constructing
GVAR(construction_fortification_time_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(construction_fortification), 0];
    player setVariable [QGVAR(construction_fortification_max), 0];

    if (isNil {player getVariable QGVAR(construction_fortification_time_cooldown)}) then {
        player setVariable [QGVAR(construction_fortification_time_cooldown), time + GVAR(construction_fortification_time_cooldown)];
    };
};