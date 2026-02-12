/**
 * Base Wreck Module
 *
 * Description: This module handles the process of rebuilding wrecks and
 * transitioning them into hangars.
 */

#define THIS_MODULE base_wreck
#include "x_macros.sqf"

// Wreck hangar object model
GVAR(base_wreck_type_hangar) = "Land_Mil_hangar_EP1";

// Amount of hangars to create
GVAR(base_wreck_amount_hangar) = 3;

// Amount of score to reward when initating a rebuild
GVAR(base_wreck_amount_score_rebuild) = 3;

// Amount of score to reward after travelling with a wreck that is then rebuilt
GVAR(base_wreck_amount_score_travel) = 5;

// Minimum distance a wreck can originate from the base to be eligible for a score reward
GVAR(base_wreck_distance_score) = 2500;

// Curated rebuild times based on vehicle type
GVAR(base_wreck_time_rebuild) = [
    [240, "Truck"],
    [240, "UAV"],
    [300, "Wheeled_APC"],
    [360, "Tank"],
    [600, "AH1Z"],
    [600, "AH64_base_EP1"],
    [600, "Mi24_Base"],
    [480, "Helicopter"],
    [600, "Plane"]
];

if (isServer) then {
    X_JIP setVariable [QGVAR(wreck_hangars), [], true];

    GVAR(base_wreck) setVariable [QGVAR(time), 0, true];

    GVAR(rebuilding) = false;

    GVAR(vehicle_wreck_types) = [];

    GVAR(wreck_hangar_triggers) = [];
    GVAR(wreck_hangars_occupied) = 0;
};

__cppfln(FUNC(THIS_MODULE,max),THIS_MODULE\functions\fn_max.sqf);
__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);
__cppfln(FUNC(THIS_MODULE,rebuild),THIS_MODULE\functions\fn_rebuild.sqf);
__cppfln(FUNC(THIS_MODULE,rebuilt),THIS_MODULE\functions\fn_rebuilt.sqf);
__cppfln(FUNC(THIS_MODULE,service),THIS_MODULE\functions\fn_service.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;