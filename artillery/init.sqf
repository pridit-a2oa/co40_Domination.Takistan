/**
 * Artillery Module
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(artillery), false];
    player setVariable [QGVAR(artillery_salvoes), 0];
};

// Set default artillery range (in meters)
GVAR(artillery_range) = 500;

// Set default artillery cooldown
GVAR(artillery_cooldown) = 600;

// Set artillery smoke grenade
GVAR(artillery_smoke) = "SmokeShellRed";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

MODULE(THIS_MODULE) = true;