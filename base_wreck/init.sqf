/**
 * Base Wreck Module
 *
 * Description: This module handles the process of rebuilding wrecks and
 * transitioning them into hangars.
 */

#define THIS_MODULE base_wreck
#include "x_macros.sqf"

// Set wreck hangar object model
GVAR(base_wreck_type_hangar) = "Land_Mil_hangar_EP1";

// Set amount of wreck hangars that will be created
GVAR(base_wreck_amount_hangar) = 3;

// Set amount of score to reward a player when rebuilding a wreck
GVAR(base_wreck_amount_score) = 5;

// Set curated rebuild times based on vehicle type
GVAR(base_wreck_time_rebuild) = [
    [360, "Wheeled_APC"],
    [480, "Tank"],
    [600, "Helicopter"],
    [720, "Plane"]
];

if (isServer) then {
    X_JIPH setVariable [QGVAR(wreck_hangars), [], true];
    
    GVAR(service_wreck) setVariable [QGVAR(time), 0, true];
    
    GVAR(rebuilding) = false;
    
    GVAR(vehicle_wreck_types) = [];
    
    GVAR(wreck_hangar_triggers) = [];
    GVAR(wreck_hangars_occupied) = 0;
};

__cppfln(FUNC(THIS_MODULE,max),THIS_MODULE\functions\fn_max.sqf);
__cppfln(FUNC(THIS_MODULE,rebuild),THIS_MODULE\functions\fn_rebuild.sqf);
__cppfln(FUNC(THIS_MODULE,rebuilt),THIS_MODULE\functions\fn_rebuilt.sqf);
__cppfln(FUNC(THIS_MODULE,service),THIS_MODULE\functions\fn_service.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;