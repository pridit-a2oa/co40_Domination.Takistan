#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_button", "_listbox"];

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};

call FUNC(interface,clear);

_listbox = DIALOG("X_MAP_WITH_LIST_DIALOG", 200);
_button = DIALOG("X_MAP_WITH_LIST_DIALOG", 300);

_button ctrlEnable false;

// Populate with airfield and static locations
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

// Populate with eligible vehicles
if !(isNil QMODULE(vehicle_teleport)) then {
    [call FUNC(vehicle_teleport,valid)] call FUNC(interface,populate);
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};