/**
 * Construction - (MG) Nest Module (Handler)
 */

#include "x_macros.sqf"

// Time between constructing
GVAR(construction_nest_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(construction_nest), 0];
    player setVariable [QGVAR(construction_nest_max), 0];

    if (isNil {player getVariable QGVAR(construction_nest_time_cooldown)}) then {
        player setVariable [QGVAR(construction_nest_time_cooldown), time + GVAR(construction_nest_time_cooldown)];
    };
};