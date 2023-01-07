/**
 * Vehicle Marker Module
 *
 * Description: This module handles marker states and persistence for vehicles.
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

// Valid vehicle types for markers
GVAR(vehicle_marker_types) = [
    "Air",
    "HMMWV_Ambulance",
    "Tank",
    "Truck",
    "Wheeled_APC"
];

// Sides to determine marker color
GVAR(vehicle_marker_types_side) = [
    [civilian, "ColorBlue"],
    [east, "ColorRed"],
    [west, "ColorBlue"]
];

// Maximum distance from original spawn position before visible
GVAR(vehicle_marker_visible) = 10;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;