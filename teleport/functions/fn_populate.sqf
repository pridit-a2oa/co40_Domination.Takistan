#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_button", "_list"];

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};

if !([lbSize 1500, 0] call BIS_fnc_areEqual) then {
    lbClear 1500;
    lbSetCurSel [1500, -1];
};

_button = DIALOG("X_TELEPORT_DIALOG", 2000);
_list = DIALOG("X_TELEPORT_DIALOG", 1500);

_button ctrlEnable false;

{
    private ["_location", "_position", "_name", "_index"];

    if !(isNil {_x getVariable QGVAR(teleport)}) then {
        _location = [position _x] call FUNC(common,nearestLocation);
        _position = locationPosition _location;

        if (player distance _x > 50) then {
            if ([str _position, "[8622.05,2454.22,-315.322]"] call BIS_fnc_areEqual) then {
                _name = "Airfield";
            } else {
                _name = text _location;
            };

            _index = _list lbAdd (" " + _name);

            _list lbSetPicture [_index, "\ca\warfare2\images\wf_city_flag.paa"];
            _list lbSetData [_index, str _position];
            _list lbSetValue [_index, if ([str _position, "[8622.05,2454.22,-315.322]"] call BIS_fnc_areEqual) then {0} else {player distance _x}];
        };
    };
} forEach (allMissionObjects GVAR(teleport_type_object));

lbSortByValue _list;

if !(isNil QMODULE(vehicle_deploy)) then {
    {
        private ["_id", "_name", "_index"];

        if (alive _x && {!([_x, GVAR(teleport)] call BIS_fnc_areEqual)}) then {
            _id = _x getVariable QGVAR(id);
            _name = [typeOf _x] call FUNC(vehicle,name);

            if !(isNil QMODULE(vehicle_marker)) then {
                _name = markerText _id;
            };

            _index = _list lbAdd _name;

            _list lbSetPicture [
                _index,
                getText (configFile >> "CfgVehicleIcons" >> format ["icon%1", [typeOf _x] call FUNC(vehicle,type)])
            ];

            _list lbSetData [_index, _id];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};