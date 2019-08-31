/**
 * Vehicle Marker Module
 *
 * Description: This module handles marker states and persistence for vehicles.
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

// Set valid vehicle types for markers
GVAR(vehicle_marker_types) = [
    "Air",
    "Tank",
    "Truck",
    "StrykerBase_EP1"
];

// Set sides to determine marker color
GVAR(vehicle_marker_types_side) = [
    [east, "ColorRed"],
    [west, "ColorBlue"]
];

// Maximum distance from original spawn position before visible
GVAR(vehicle_marker_visible) = 10;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;