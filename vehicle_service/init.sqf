/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

GVAR(vehicle_service_type_names) = [
    ["ground",      "Ground Vehicle",   "LandVehicle"],
    ["chopper",     "Chopper",          "Helicopter"],
    ["jet",         "Jet",              "Plane"]
];

GVAR(vehicle_service_type_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

__cppfln(FUNC(THIS_MODULE,rearm),THIS_MODULE\functions\fn_rearm.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);

MODULE(THIS_MODULE) = true;