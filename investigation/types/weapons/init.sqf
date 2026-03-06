/**
 * Investigation - Weapons Cache Module
 *
 * Description: This module is responsible for handling the investigation to
 * clear a defended weapons cache.
 */

#define THIS_MODULE investigation_weapons
#include "x_macros.sqf"

if !(isServer) exitWith {};
if (isNil QMODULE(investigation)) exitWith {};

// Type of investigation
GVAR(investigation_weapons) = ["weapons", "Weapons Cache"];

// The object composition to generate
GVAR(investigation_weapons_type) = "WeaponsStore1_TK_EP1";

// [GVAR(investigation_types), GVAR(investigation_weapons)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,create),investigation\types\weapons\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;