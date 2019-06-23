/**
 * Airdrop Module
 *
 * Description: This module enables players to call in an airdrop.
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

// Aircraft type
GVAR(airdrop_type_aircraft) = "C130J_US_EP1";

// Default payload type
GVAR(airdrop_type_payload) = ["Ammobox", "USVehicleBox_EP1"];

// Smoke grenade type
GVAR(airdrop_type_smoke) = "SmokeShellGreen";

// Minimum distance from base the position has to be
GVAR(airdrop_distance_base) = 500;

// Maximum distance the player can call within
GVAR(airdrop_distance_player) = 300;

// Initial spawn distance when calling
GVAR(airdrop_distance_spawn) = 4000;

// Minimum time between requests
GVAR(airdrop_time_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(airdrop), false];
    player setVariable [QGVAR(airdrop_types), [GVAR(airdrop_type_payload)]];
    
    if (isNil {player getVariable QGVAR(airdrop_type)}) then {
        player setVariable [QGVAR(airdrop_type), [0, GVAR(airdrop_type_payload) select 1]];
    };
    
    if (isNil {player getVariable QGVAR(airdrop_cooldown)}) then {
        player setVariable [QGVAR(airdrop_cooldown), time + GVAR(airdrop_time_cooldown)];
    };
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(airdrop_call), false, true];
    X_JIPH setVariable [QGVAR(airdrop_progress), false, true];
};

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

MODULE(THIS_MODULE) = true;