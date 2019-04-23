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
};

// Set airdrop aircraft spawn distance
GVAR(airdrop_aircraft_distance) = 4500;

// Set default airdrop cooldown
GVAR(airdrop_cooldown) = 300;

// Set airdrop aircraft
GVAR(airdrop_aircraft) = "C130J_US_EP1";

// Set airdrop smoke grenade
GVAR(airdrop_smoke) = "SmokeShellGreen";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,drop),THIS_MODULE\functions\fn_drop.sqf);

MODULE(THIS_MODULE) = true;