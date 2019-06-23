/**
 * Vehicle MHQ Module
 *
 * Description: This module designates one or more types of vehicle to be
 * designated as a MHQ.
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"

// Set vehicle type(s) to be designated as MHQ
GVAR(vehicle_mhq_types) = [
    "M1133_MEV_EP1"
];

// Set type of MHQ net
GVAR(vehicle_mhq_type_net) = "Land_CamoNetB_NATO_EP1";

// Set minimum distance from base before being able to deploy
GVAR(vehicle_mhq_distance_base) = 500;

// Set minimum distance from an enemy before being able to deploy
GVAR(vehicle_mhq_distance_enemy) = 150;

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,undeploy),THIS_MODULE\functions\fn_undeploy.sqf);

MODULE(THIS_MODULE) = true;