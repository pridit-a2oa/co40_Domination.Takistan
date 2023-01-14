/**
 * Vehicle Loadout Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_type", "_loadouts", "_name", "_menu", "_index"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

_loadouts = ([_vehicle] call FUNC(THIS_MODULE,find)) select 0;

_name = (_vehicle getVariable QGVAR(loadout)) select 0;

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd format [
    "Switch Loadout (%1/%2: %3)",
    (_loadouts find _name) + 1,
    count _loadouts,
    _name
];

_menu lbSetData [_index, "loadout"];