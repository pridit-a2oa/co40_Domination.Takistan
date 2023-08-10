/**
 * Admin Module - Perk Submodule
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

if ([GVAR(admin_type_players) find (getPlayerUID player), -1] call BIS_fnc_areEqual) exitWith {false};
if (isMultiplayer && {!isServer} && {!(serverCommandAvailable "#logout")}) exitWith {false};

true