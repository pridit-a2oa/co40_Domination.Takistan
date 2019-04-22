/**
 * Vehicle Teleport Module
 *
 * Description: This module provides capability for a player to teleport to
 * a vehicle.
 */

#define THIS_MODULE vehicle_teleport
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(teleport), false];
};

__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;