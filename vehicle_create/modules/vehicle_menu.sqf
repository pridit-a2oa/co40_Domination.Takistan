/**
 * Vehicle Create Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_create_types) find (typeOf _vehicle) == -1) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd "Create ATV";
_menu lbSetData [_index, "atv"];