/**
 * Vehicle Upgrade Module
 *
 * Description: This module facilitates upgrading (switching models) of a specified type.
 */

#define THIS_MODULE vehicle_upgrade
#include "x_macros.sqf"

// Set upgradable vehicles
GVAR(vehicle_upgrade_types) = [
    "M1128_MGS_EP1",
    "M1129_MC_EP1",
    "M1130_CV_EP1",
    "M1133_MEV_EP1",
    "M1135_ATGMV_EP1"
];

// Maximum distance from base the upgrade can be performed
GVAR(vehicle_upgrade_distance_base) = 450;

if (hasInterface) then {
    if (isNil {player getVariable QGVAR(vehicle_upgrade_type)}) then {
        player setVariable [QGVAR(vehicle_upgrade_type), [0, "M1130_CV_EP1"]];
    };
};

__cppfln(FUNC(THIS_MODULE,upgrade),THIS_MODULE\functions\fn_upgrade.sqf);

MODULE(THIS_MODULE) = true;