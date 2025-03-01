/**
 * Vehicle UAV Module
 *
 * Description: This module facilitates remote controlling of specific vehicle
 * types, designated as UAVs.
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

// Vehicle types that can be remote controlled
GVAR(vehicle_uav_types) = [
    "Ka137_PMC",
    "MQ9PredatorB_US_EP1"
];

// Player transition time between assuming/unassuming
GVAR(vehicle_uav_time_wait) = 6;

if (hasInterface) then {
    GVAR(vehicle_uav_effects) = [];
    GVAR(vehicle_uav_player) = [];
};

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,control),THIS_MODULE\functions\fn_control.sqf);
__cppfln(FUNC(THIS_MODULE,disconnect),THIS_MODULE\functions\fn_disconnect.sqf);
__cppfln(FUNC(THIS_MODULE,effect),THIS_MODULE\functions\fn_effect.sqf);
__cppfln(FUNC(THIS_MODULE,entities),THIS_MODULE\functions\fn_entities.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,target),THIS_MODULE\functions\fn_target.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;