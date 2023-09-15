/**
 * Vehicle Service Module
 *
 * Description: This module facilitates autonomous full servicing of occupied
 * vehicles at relevant designated areas.
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// The different types of possible services
GVAR(vehicle_service_type_names) = [
    ["land",        "Land Vehicle",     "LandVehicle"],
    ["chopper",     "Chopper",          "Helicopter"],
    ["jet",         "Jet",              "Plane"]
];

// Maximum current speed of vehicle to be eligible to be serviced
GVAR(vehicle_service_speed) = 15;

// The cooldown when servicing a vehicle
GVAR(vehicle_service_time_cooldown) = 45;

__cppfln(FUNC(THIS_MODULE,rearm),THIS_MODULE\functions\fn_rearm.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;