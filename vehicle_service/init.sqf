/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(repair_kits), 0, true];
    player setVariable [QGVAR(repair_kits_max), 0, true];
    player setVariable [QGVAR(repair_full), false];
};

// Set service vehicles (inherent functionality)
GVAR(service_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

__cppfln(FUNC(THIS_MODULE,repair),THIS_MODULE\functions\fn_repair.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;