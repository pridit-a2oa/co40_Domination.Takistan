#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_button", "_list", "_progress", "_time", "_color"];

disableSerialization;

_button = DIALOG("X_RD_DIALOG", 500);
_button ctrlEnable false;

_list = DIALOG("X_RD_DIALOG", 100);

{
    _progress = [_x, "progress"] call FUNC(THIS_MODULE,item);
    _time = [_x, "time"] call FUNC(THIS_MODULE,item);

    if (_progress select 0 > 0) then {
        _list lbAdd ([_x] call FUNC(vehicle,name));
    } else {
        _list lbAdd "???";
    };
    
    _list lbSetData [_forEachIndex, _x];
    _list lbSetValue [_forEachIndex, (_time select 1) + _forEachIndex];

    _color = if (_progress select 0 > 0) then {
        if (_progress select 0 == _progress select 1) then {
            [0, 1, 0, 0.8];
        } else {
            [1, 1, 0, 0.8];
        };
    } else {
        [1, 1, 1, 0.6];
    };

    _list lbSetColor [_forEachIndex, _color];
} forEach GVAR(base_rd_type_vehicles);