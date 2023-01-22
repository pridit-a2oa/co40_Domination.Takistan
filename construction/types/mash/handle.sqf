/**
 * Construction - MASH Module (Handler)
 */

#include "x_macros.sqf"

// Time between constructing
GVAR(construction_mash_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(construction_mash), 0];
    player setVariable [QGVAR(construction_mash_max), 0];

    if (isNil {player getVariable QGVAR(construction_mash_time_cooldown)}) then {
        player setVariable [QGVAR(construction_mash_time_cooldown), time + GVAR(construction_mash_time_cooldown)];
    };
};