/**
 * Vehicle Create Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_type", "_menu", "_index"];

PARAMS_1(_vehicle);

_type = GVAR(vehicle_create_types) find (typeOf _vehicle);

if (_type == -1) exitWith {};

_vehicles = (GVAR(vehicle_create_types_vehicle) select _type) select 1;

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

{
    _index = _menu lbAdd (format ["Create %1", [_x] call FUNC(vehicle,name)]);
    _menu lbSetData [_index, _x];
} forEach _vehicles;