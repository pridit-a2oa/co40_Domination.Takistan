#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_listbox", "_button"];

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};
if !([typeName (uiNamespace getVariable "X_VEHICLE_UAV_DIALOG"), "DISPLAY"] call BIS_fnc_areEqual) exitWith {};

call FUNC(interface,clear);

_listbox = DIALOG("X_VEHICLE_UAV_DIALOG", 200);
_button = DIALOG("X_VEHICLE_UAV_DIALOG", 300);

_button ctrlEnable false;

{
    private ["_id", "_name", "_index"];

    if (alive _x) then {
        _id = _x getVariable QGVAR(id);
        _name = [typeOf _x] call FUNC(vehicle,name);

        if !(isNil QMODULE(vehicle_marker)) then {
            while {[markerText _id, ""] call BIS_fnc_areEqual} do {
                sleep 0.2;
            };

            _name = toArray (markerText _id);
            _name set [0, objNull];

            _name = toString (_name - [objNull]);
        };

        _index = _listbox lbAdd format [
            "%1 [%2/%3]",
            _name,
            count crew _x,
            count crew _x + ((_x emptyPositions "Driver") + (_x emptyPositions "Gunner"))
        ];

        _listbox lbSetPicture [
            _index,
            ([typeOf _x] call FUNC(vehicle,type)) select 1
        ];

        _listbox lbSetData [_index, _id];
    };
} forEach (call FUNC(THIS_MODULE,entities));