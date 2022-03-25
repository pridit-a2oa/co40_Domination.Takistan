#include "x_macros.sqf"
private ["_vehicle", "_clear", "_list", "_button", "_name", "_position", "_index"];

PARAMS_2(_vehicle, _clear);

disableSerialization;

if (_clear) then {
    lbClear 1500;
    lbSetCurSel [1500, -1];
};

_button = DIALOG("X_TELEPORT_DIALOG", 2000);
_button ctrlEnable false;

_list = DIALOG("X_TELEPORT_DIALOG", 1500);

if (player distance GVAR(flag) > 10) then {
    _list lbAdd "Base";
};

if (!isNil QMODULE(vehicle_deploy)) then {
    {
        if (alive _x && {_vehicle != _x} && {{!isPlayer _x} count crew _x == 0}) then {
            _id = _x getVariable QGVAR(id);
            _name = [typeOf _x] call FUNC(vehicle,name);
            
            if (!isNil QMODULE(vehicle_marker)) then {
                _name = markerText _id;
            };
            
            _index = _list lbAdd _name;
            _list lbSetData [_index, _id];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};