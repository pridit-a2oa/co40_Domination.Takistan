#include "x_macros.sqf"
private ["_vehicle", "_clear", "_button", "_list", "_location", "_position", "_name", "_index", "_id"];

PARAMS_2(_vehicle, _clear);

disableSerialization;

if (_clear) then {
    lbClear 1500;
    lbSetCurSel [1500, -1];
};

_button = DIALOG("X_TELEPORT_DIALOG", 2000);
_button ctrlEnable false;

_list = DIALOG("X_TELEPORT_DIALOG", 1500);
    
{
    if !(isNil {_x getVariable QGVAR(teleport)}) then {
        _location = [position _x] call FUNC(common,nearestLocation);
        _position = locationPosition _location;

        if (player distance _x > 50) then {
            if ([str _position, "[8622.05,2454.22,-315.322]"] call BIS_fnc_areEqual) then {
                _name = "Flag: Airfield";
            } else {
                _name = format ["Flag: %1", text _location];
            };

            _index = _list lbAdd _name;
            _list lbSetData [_index, str _position];
            _list lbSetValue [_index, if ([str _position, "[8622.05,2454.22,-315.322]"] call BIS_fnc_areEqual) then {0} else {player distance _x}];
        };
    };
} forEach (allMissionObjects GVAR(teleport_type_object));

lbSortByValue _list;

if (!isNil QMODULE(vehicle_deploy)) then {
    {
        if (alive _x && {_vehicle != _x} && {{!isPlayer _x} count crew _x == 0}) then {
            _id = _x getVariable QGVAR(id);
            _name = [typeOf _x] call FUNC(vehicle,name);
            
            if (!isNil QMODULE(vehicle_marker)) then {
                _name = markerText _id;
            };
            
            _index = _list lbAdd ("-" + _name);
            _list lbSetData [_index, _id];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};