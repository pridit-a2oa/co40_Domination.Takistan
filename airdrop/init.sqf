/**
 * Airdrop Module
 *
 * Description: This module enables players to be able to call in an airdrop.
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(airdrop), false];
    player setVariable [QGVAR(airdrop_type), "USVehicleBox_EP1"];
    player setVariable [QGVAR(airdrop_cooldown), time];
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(airdrop_call), false, true];
    X_JIPH setVariable [QGVAR(airdrop_progress), false, true];
};

// Aircraft type
GVAR(airdrop_type_aircraft) = "C130J_US_EP1";

// Smoke grenade type
GVAR(airdrop_type_smoke) = "SmokeShellGreen";

// Initial spawn distance when calling
GVAR(airdrop_distance_spawn) = 4000;

// Minimum distance from base the position has to be
GVAR(airdrop_distance_base) = 500;

// Maximum distance the player can call within
GVAR(airdrop_distance_player) = 300;

// Minimum time between requests
GVAR(airdrop_time_cooldown) = 600;

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,drop),THIS_MODULE\functions\fn_drop.sqf);

MODULE(THIS_MODULE) = true;