/**
 * Mission Mini - Encampment Module
 *
 * Description: This module is responsible for handling the mini mission to
 * clear an enemy encampment.
 */

#define THIS_MODULE mission_mini_encampment
#include "x_macros.sqf"

if !(isServer) exitWith {};

// Type of mini mission
GVAR(mission_mini_encampment) = ["encampment", "Enemy Encampment"];

// The object composition to use to generate the camp
GVAR(mission_mini_encampment_type) = "Camp1_TK_EP1";

[GVAR(mission_mini_types), GVAR(mission_mini_encampment)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,create),mission_mini\types\encampment\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;