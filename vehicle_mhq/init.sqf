/**
 * Vehicle MHQ Module
 *
 * Description: This module provides the capability for a vehicle to deploy as
 * a MHQ.
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"

// Vehicles that can be deployed as a MHQ
GVAR(vehicle_mhq_types) = [
    "BMP2_HQ_TK_EP1",
    "M1133_MEV_EP1"
];

// Net types associated with faction
GVAR(vehicle_mhq_types_net) = [
    ["BIS_TK", "Land_CamoNetVar_EAST_EP1"],
    ["BIS_US", "Land_CamoNetVar_NATO_EP1"]
];

MODULE(THIS_MODULE) = true;