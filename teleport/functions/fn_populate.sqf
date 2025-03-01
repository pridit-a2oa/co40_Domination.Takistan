#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_listbox", "_button"];

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};

call FUNC(interface,clear);

_listbox = DIALOG("X_TELEPORT_DIALOG", 200);
_button = DIALOG("X_TELEPORT_DIALOG", 300);

_button ctrlEnable false;

{
    private ["_location", "_position", "_index"];

    if !(isNil {_x getVariable QGVAR(teleport)}) then {
        _location = [position _x] call FUNC(common,nearestLocation);
        _position = locationPosition _location;

        if (player distance _x > 50) then {
            _index = _listbox lbAdd format [" %1", if ([_position, [8622.05,2454.22,-315.322]] call BIS_fnc_areEqual) then {
                "Airfield";
            } else {
                text _location;
            }];

            _listbox lbSetPicture [_index, "\ca\warfare2\images\wf_city_flag.paa"];
            _listbox lbSetData [_index, str _position];
            _listbox lbSetValue [_index, if ([str _position, "[8622.05,2454.22,-315.322]"] call BIS_fnc_areEqual) then {0} else {player distance _x}];
        };
    };
} forEach (allMissionObjects GVAR(teleport_type_object));

lbSortByValue _listbox;

if !(isNil QMODULE(vehicle_deploy)) then {
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
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};