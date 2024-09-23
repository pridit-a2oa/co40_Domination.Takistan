/**
 * Vehicle Upgrade Module (Handler)
 */

#include "x_macros.sqf"

// Time between upgrading
GVAR(vehicle_upgrade_time_cooldown) = 60;

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_upgrade_types), [
        ["CV", "M1130_CV_EP1"],
        ["MEV", "M1133_MEV_EP1"]
    ]];

    if (isNil {player getVariable QGVAR(vehicle_upgrade_cooldown)}) then {
        player setVariable [QGVAR(vehicle_upgrade_cooldown), time + GVAR(vehicle_upgrade_time_cooldown)];
    };
};