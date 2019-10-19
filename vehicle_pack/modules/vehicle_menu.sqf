/**
 * Vehicle Pack Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_packed", "_string", "_fold", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_pack_types) find (typeOf _vehicle) == -1) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_packed = _vehicle getVariable QGVAR(packed);

_string = if (!isNil "_packed" && {_packed}) then {"Unfold"} else {"Fold"};
_fold = if (_vehicle isKindOf "Plane") then {"Wings"} else {"Main Rotor"};

_index = _menu lbAdd (_string + " " + _fold);
_menu lbSetData [_index, "pack"];