/**
 * Airdrop Module
 *
 * Description: This module enables players to call in an airdrop.
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

// Aircraft type
GVAR(airdrop_type_aircraft) = "C130J_US_EP1";

// Default payloads
GVAR(airdrop_type_payloads) = [
    ["Ammobox", "USVehicleBox_EP1"],
    ["HMMMX", "HMMWV_DES_EP1"]
];

// Smoke grenade type
GVAR(airdrop_type_smoke) = "SmokeShellGreen";

// Minimum distance from base the drop position has to be
GVAR(airdrop_distance_base) = 500;

// Maximum distance the player can call within
GVAR(airdrop_distance_player) = 300;

// Initial spawn distance when calling
GVAR(airdrop_distance_spawn) = 4000;

// Minimum time (seconds) between requests
GVAR(airdrop_time_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(airdrop), false];
    player setVariable [QGVAR(airdrop_types), GVAR(airdrop_type_payloads)];

    if (isNil {player getVariable QGVAR(airdrop_type)}) then {
        player setVariable [QGVAR(airdrop_type), [0, (GVAR(airdrop_type_payloads) select 0) select 1]];
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