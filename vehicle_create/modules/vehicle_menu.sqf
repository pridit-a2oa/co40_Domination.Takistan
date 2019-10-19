/**
 * Vehicle Create Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_create_types) find (typeOf _vehicle) == -1) exitWith {};

_type = (GVAR(vehicle_create_types_vehicle) select 0) select 1;

{
    if (_x select 0 == typeOf _vehicle) exitWith {
        _type = _x select 1;
    };
} forEach GVAR(vehicle_create_types_vehicle);

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd (format ["Create %1", [_type] call FUNC(vehicle,name)]);
_menu lbSetData [_index, "vehicle"];