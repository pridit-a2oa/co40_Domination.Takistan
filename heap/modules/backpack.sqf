/**
 * Heap Module - Backpack Submodule
 */

#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_weapon"];

PARAMS_1(_weapon);

if ([[_weapon] call FUNC(THIS_MODULE,valid), ""] call BIS_fnc_areEqual || {[unitBackpack player, objNull] call BIS_fnc_areEqual}) exitWith {true};

false