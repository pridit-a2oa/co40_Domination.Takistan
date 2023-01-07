/**
 * Vehicle Deploy Module
 *
 * Description: This module provides the facilitation of deploying a vehicle.
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"

// Minimum distance from base to be eligible to deploy
GVAR(vehicle_deploy_distance_base) = 500;

// Minimum distance from the closest building to be eligible to deploy
GVAR(vehicle_deploy_distance_building) = 60;

// Minimum time (seconds) between deployments
GVAR(vehicle_deploy_cooldown_deploy) = 30;

// The degrees threshold of pitch/bank to be eligible to deploy
GVAR(vehicle_deploy_threshold_terrain) = 12;

__cppfln(FUNC(THIS_MODULE,cleanup),THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,types),THIS_MODULE\functions\fn_types.sqf);

MODULE(THIS_MODULE) = true;