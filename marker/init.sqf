/**
 * Marker Module
 *
 * Description: This module handles marker states and persistence.
 */

#define THIS_MODULE marker
#include "x_macros.sqf"

// Set valid vehicle types for markers
GVAR(marker_vehicle_types) = [
    "Air",
    "Tank",
    "Truck",
    "StrykerBase_EP1"
];

// Maximum distance from original spawn position before visible
GVAR(vehicle_distance_visible) = 10;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;