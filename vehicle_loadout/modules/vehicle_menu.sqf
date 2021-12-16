/**
 * Vehicle Loadout Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_menu", "_index"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd format ["Change Loadout (%1)", (_vehicle getVariable QGVAR(loadout)) select 0];
_menu lbSetData [_index, "loadout"];