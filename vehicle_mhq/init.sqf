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
    "BMP2_HQ_TK_EP1",
    "M1133_MEV_EP1"
];

// Set possible types of nets
GVAR(vehicle_mhq_types_net) = [
    ["BIS_TK", "Land_CamoNetB_EAST_EP1"],
    ["BIS_US", "Land_CamoNetB_NATO_EP1"]
];

// Set minimum distance from base before being able to deploy
GVAR(vehicle_mhq_distance_base) = 500;

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,undeploy),THIS_MODULE\functions\fn_undeploy.sqf);

MODULE(THIS_MODULE) = true;