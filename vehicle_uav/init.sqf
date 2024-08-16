/**
 * Vehicle UAV Module
 *
 * Description: This module facilitates remote controlling of specific vehicle
 * types, designated as UAVs.
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

// Vehicle type that can be remote controlled
GVAR(vehicle_uav_type) = "MQ9PredatorB_US_EP1";

if (hasInterface) then {
    GVAR(vehicle_uav_effects) = [];
};

__cppfln(FUNC(THIS_MODULE,assume),THIS_MODULE\functions\fn_assume.sqf);
__cppfln(FUNC(THIS_MODULE,effect),THIS_MODULE\functions\fn_effect.sqf);
__cppfln(FUNC(THIS_MODULE,release),THIS_MODULE\functions\fn_release.sqf);

MODULE(THIS_MODULE) = true;