#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_listbox", "_button"];

disableSerialization;

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

            _name = markerText _id;
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