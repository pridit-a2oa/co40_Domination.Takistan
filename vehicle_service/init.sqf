/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// Set service vehicles (inherent functionality)
GVAR(vehicle_service_types) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

if (hasInterface) then {
    player setVariable [QGVAR(repair_kits), 0, true];
    player setVariable [QGVAR(repair_kits_max), 0, true];
    player setVariable [QGVAR(repair_full), false];
};

__cppfln(FUNC(THIS_MODULE,repair),THIS_MODULE\functions\fn_repair.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;