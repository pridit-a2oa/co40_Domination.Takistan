/**
 * Vehicle MHQ Module
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"

// Set vehicle type to be designated as MHQ
GVAR(vehicle_mhq_types) = [
    "M1133_MEV_EP1"
];

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);
__cppfln(FUNC(THIS_MODULE,undeploy),THIS_MODULE\functions\fn_undeploy.sqf);

MODULE(THIS_MODULE) = true;