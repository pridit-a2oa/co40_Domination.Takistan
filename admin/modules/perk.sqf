/**
 * Admin Module - Perk Submodule
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

if !(getPlayerUID player in GVAR(admin_type_players)) exitWith {false};
if (isMultiplayer && {!isServer && {!(serverCommandAvailable "#logout")}}) exitWith {false};

true