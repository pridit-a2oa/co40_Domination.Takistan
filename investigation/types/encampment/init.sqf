/**
 * Investigation - Encampment Module
 *
 * Description: This module is responsible for handling the investigation to
 * clear an enemy encampment.
 */

#define THIS_MODULE investigation_encampment
#include "x_macros.sqf"

if !(isServer) exitWith {};
if (isNil QMODULE(investigation)) exitWith {};

// Type of investigation
GVAR(investigation_encampment) = ["encampment", "Enemy Encampment"];

// The object composition to use to generate the camp
GVAR(investigation_encampment_type) = "Camp1_TK_EP1";

[GVAR(investigation_types), GVAR(investigation_encampment)] call BIS_fnc_arrayPush;

__cppfln(FUNC(THIS_MODULE,create),investigation\types\encampment\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;