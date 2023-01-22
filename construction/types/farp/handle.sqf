/**
 * Construction - FARP Module (Handler)
 */

#include "x_macros.sqf"

// Time between constructing
GVAR(construction_farp_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(construction_farp), 0];
    player setVariable [QGVAR(construction_farp_max), 0];

    if (isNil {player getVariable QGVAR(construction_farp_time_cooldown)}) then {
        player setVariable [QGVAR(construction_farp_time_cooldown), time + GVAR(construction_farp_time_cooldown)];
    };
};