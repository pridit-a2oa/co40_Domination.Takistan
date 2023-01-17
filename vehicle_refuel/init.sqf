/**
 * Vehicle Refuel Module
 *
 * Description: This module enables players to refuel vehicles via the use
 * of a fuel can.
 */

#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"

// Vehicles designated with refuel capacity
GVAR(vehicle_refuel_types) = [
    "MtvrRefuel_DES_EP1"
];

if (hasInterface) then {
    GVAR(refuelling) = false;
};

__cppfln(FUNC(THIS_MODULE,refuel),THIS_MODULE\functions\fn_refuel.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;