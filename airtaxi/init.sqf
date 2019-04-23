/**
 * Airtaxi Module
 *
 * Description: This module enables players to radio in an air taxi that will
 * take them to a designated location (placed within the editor).
 */

#define THIS_MODULE airtaxi
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(air_taxi), false];
};

// Set air taxi smoke grenade
GVAR(air_taxi_smoke) = "SmokeShellBlue";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

MODULE(THIS_MODULE) = true;