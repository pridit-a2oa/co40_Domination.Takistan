/**
 * Vehicle Cargo Module
 *
 * Description: This module enables players to load land vehicles into an
 * aircraft & paradrop them.
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"

// Aircraft type capable of loading vehicles
GVAR(vehicle_cargo_type_aircraft) = "C130J_US_EP1";

// Maximum amount of vehicles that can ever be loaded at once
GVAR(vehicle_cargo_amount_max) = 2;

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_cargo), 2];
};

__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,types),THIS_MODULE\functions\fn_types.sqf);
__cppfln(FUNC(THIS_MODULE,unload),THIS_MODULE\functions\fn_unload.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;