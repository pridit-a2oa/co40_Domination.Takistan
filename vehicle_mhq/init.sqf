/**
 * Vehicle MHQ Module
 *
 * Description: This module designates one or more types of vehicle to be
 * designated as a MHQ and deployed/undeployed as such.
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"

// Set vehicle type to be designated as MHQ
GVAR(vehicle_mhq_types) = [
    "M1133_MEV_EP1"
];

// Set MHQ net
GVAR(vehicle_mhq_net) = "Land_CamoNetB_NATO_EP1";

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,undeploy),THIS_MODULE\functions\fn_undeploy.sqf);

MODULE(THIS_MODULE) = true;