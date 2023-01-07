/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// The different types of possible services
GVAR(vehicle_service_type_names) = [
    ["land",        "Land Vehicle",     "LandVehicle"],
    ["chopper",     "Chopper",          "Helicopter"],
    ["jet",         "Jet",              "Plane"]
];

// Vehicles with inherent servicing capability
GVAR(vehicle_service_type_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

// Maximum current speed of vehicle to be eligible to be serviced
GVAR(vehicle_service_speed) = 15;

// The cooldown when servicing a vehicle
GVAR(vehicle_service_time_cooldown) = 45;

__cppfln(FUNC(THIS_MODULE,rearm),THIS_MODULE\functions\fn_rearm.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;