/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// Set the different types of possible services.
GVAR(vehicle_service_type_names) = [
    ["ground",      "Ground Vehicle",   "LandVehicle"],
    ["chopper",     "Chopper",          "Helicopter"],
    ["jet",         "Jet",              "Plane"]
];

// Set vehicles with inherent servicing capability.
GVAR(vehicle_service_type_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

// Set maximum current speed of vehicle to be eligible to be serviced.
GVAR(vehicle_service_speed) = 15;

// Set the cooldown when servicing a vehicle.
GVAR(vehicle_service_time_cooldown) = 45;

__cppfln(FUNC(THIS_MODULE,rearm),THIS_MODULE\functions\fn_rearm.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;