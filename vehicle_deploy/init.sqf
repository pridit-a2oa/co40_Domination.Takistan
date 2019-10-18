/**
 * Vehicle Deploy Module
 *
 * Description: This module provides the facilitation of deploying a vehicle.
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"

// Set minimum distance from base before being able to deploy.
GVAR(vehicle_deploy_distance_base) = 500;

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;