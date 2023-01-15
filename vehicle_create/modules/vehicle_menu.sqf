/**
 * Vehicle Create Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_types", "_type", "_menu", "_index"];

PARAMS_1(_vehicle);

_types = GVAR(vehicle_create_types);

_type = ([0, _types] call FUNC(common,arrayValues)) find (typeOf _vehicle);

if (_type == -1) exitWith {};

_vehicles = ([1, _types] call FUNC(common,arrayValues)) select _type;

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

{
    _index = _menu lbAdd (format ["Unpack %1", [_x] call FUNC(vehicle,name)]);
    _menu lbSetData [_index, format ["[""create"", ""%1""]", _x]];
} forEach _vehicles;