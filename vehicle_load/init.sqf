/**
 * Vehicle Load Module
 */

#define THIS_MODULE vehicle_load
#include "x_macros.sqf"

// Set aircraft type capable of loading vehicles
GVAR(vehicle_load_type_aircraft) = "C130J_US_EP1";

// Set maximum amount of vehicles that can ever be loaded at once
GVAR(vehicle_load_amount_max) = 2;

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_load), 0];
};

__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,types),THIS_MODULE\functions\fn_types.sqf);
__cppfln(FUNC(THIS_MODULE,unload),THIS_MODULE\functions\fn_unload.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;