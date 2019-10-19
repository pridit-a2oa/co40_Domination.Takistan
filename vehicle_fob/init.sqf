/**
 * Vehicle FOB Module
 *
 * Description: This module provides the capability for a vehicle to deploy as
 * a FOB.
 */

#define THIS_MODULE vehicle_fob
#include "x_macros.sqf"

// Set vehicles that can be deployed as a FOB.
GVAR(vehicle_fob_types) = [
    "C130J_US_EP1"
];

MODULE(THIS_MODULE) = true;