/**
 * Mission Mini - Cache Module
 *
 * Description: This module is responsible for handling the mini mission to
 * clear a defended weapons cache.
 */

#define THIS_MODULE mission_mini_cache
#include "x_macros.sqf"

if !(isServer) exitWith {};

// Type of mini mission
GVAR(mission_mini_cache) = ["cache", "Weapons Cache"];

// The object composition to generate
GVAR(mission_mini_cache_type) = "WeaponsStore1_TK_EP1";

// [GVAR(mission_mini_types), GVAR(mission_mini_encampment)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,create),mission_mini\types\cache\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;