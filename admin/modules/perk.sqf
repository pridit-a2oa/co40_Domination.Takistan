/**
 * Admin Module - Perk Submodule
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

if (isMultiplayer && {GVAR(admin_type_players) find (getPlayerUID player) == -1}) exitWith {false};
if (isMultiplayer && {!isServer} && {!(serverCommandAvailable "#logout")}) exitWith {false};

true