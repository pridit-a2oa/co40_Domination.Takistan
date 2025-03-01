#include "x_macros.sqf"
private ["_entities", "_listbox"];

PARAMS_1(_entities);

_listbox = DIALOG("X_MAP_WITH_LIST_DIALOG", 200);

lbSortByValue _listbox;

{
    private ["_id", "_name", "_index"];

    if (alive _x && {!([_x, GVAR(teleport)] call BIS_fnc_areEqual)}) then {
        _id = _x getVariable QGVAR(id);
        _name = [typeOf _x] call FUNC(vehicle,name);

        if !(isNil QMODULE(vehicle_marker)) then {
            while {[markerText _id, ""] call BIS_fnc_areEqual} do {
                sleep 0.2;
            };

            _name = markerText _id;
        };

        _index = _listbox lbAdd _name;

        _listbox lbSetPicture [
            _index,
            ([typeOf _x] call FUNC(vehicle,type)) select 1
        ];

        _listbox lbSetData [_index, _id];
    };
} forEach _entities;