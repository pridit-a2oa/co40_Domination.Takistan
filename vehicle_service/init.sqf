/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// Set service vehicles (inherent functionality)
GVAR(service_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

MODULE(THIS_MODULE) = true;