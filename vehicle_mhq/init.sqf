/**
 * Vehicle MHQ Module
 *
 * Description: This module provides the capability for a vehicle to deploy as
 * a MHQ.
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"

// Set vehicles that can be deployed as a MHQ.
GVAR(vehicle_mhq_types) = [
    "BMP2_HQ_TK_EP1",
    "M1133_MEV_EP1"
];

// Set net types associated with faction.
GVAR(vehicle_mhq_types_net) = [
    ["BIS_TK", "Land_CamoNetB_EAST_EP1"],
    ["BIS_US", "Land_CamoNetB_NATO_EP1"]
];

__cppfln(FUNC(THIS_MODULE,deploy),THIS_MODULE\functions\fn_deploy.sqf);

MODULE(THIS_MODULE) = true;