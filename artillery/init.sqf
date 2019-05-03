/**
 * Artillery Module
 *
 * Description: This module enables players to call in an artillery strike.
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

// Shell type
GVAR(artillery_type_shell) = "ARTY_Sh_105_HE";

// Smoke grenade type
GVAR(artillery_type_smoke) = "SmokeShellRed";

// Minimum distance from base the position has to be
GVAR(artillery_distance_base) = 1200;

// Minimum distance from any friendly units
GVAR(artillery_distance_friendly) = 150;

// Maximum distance from player position
GVAR(artillery_distance_range) = 500;

// Number of shells per salvo
GVAR(artillery_amount_shell) = 3;

// Time between requests
GVAR(artillery_time_cooldown) = 1200;

// Time before strikes initiate once called
GVAR(artillery_time_wait) = 20;

if (hasInterface) then {
    player setVariable [QGVAR(artillery), false];
    player setVariable [QGVAR(artillery_range), GVAR(artillery_distance_range)];
    player setVariable [QGVAR(artillery_salvoes), 0];
    player setVariable [QGVAR(artillery_cooldown), time + GVAR(artillery_time_cooldown)];
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(artillery_call), false, true];
    X_JIPH setVariable [QGVAR(artillery_progress), false, true];
};

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,trail),THIS_MODULE\functions\fn_trail.sqf);

MODULE(THIS_MODULE) = true;