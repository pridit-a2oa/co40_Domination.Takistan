/**
 * Vehicle Pack Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_packed", "_string", "_fold"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_pack_types) find (typeOf _vehicle) == -1) exitWith {false};

_packed = _vehicle getVariable QGVAR(packed);

_string = if (!isNil "_packed" && {_packed}) then {"Unfold"} else {"Fold"};
_fold = if (_vehicle isKindOf "Plane") then {"Wings"} else {"Main Rotor"};

[_string + " " + _fold, "pack"] call FUNC(vehicle_menu,populate);

true