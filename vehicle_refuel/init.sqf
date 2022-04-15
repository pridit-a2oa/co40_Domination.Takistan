/**
 * Vehicle Refuel Module
 *
 * Description: This module enables players to refuel vehicles via the use
 * of a fuel can.
 */

#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"

// Set vehicle type to replenish from.
GVAR(fuel_type_vehicle) = "MtvrRefuel_DES_EP1";

if (hasInterface) then {
    GVAR(refuelling) = false;
    
    player setVariable [QGVAR(fuel_cans), 0];
    player setVariable [QGVAR(fuel_cans_max), 1];
};

__cppfln(FUNC(THIS_MODULE,refuel),THIS_MODULE\functions\fn_refuel.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;