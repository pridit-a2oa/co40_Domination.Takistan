#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_clear", "_button", "_list", "_progress", "_time", "_color"];

PARAMS_1(_clear);

disableSerialization;

if (!isNil "_clear" && {_clear}) then {
    lbClear 100;
};

_button = DIALOG("X_RD_DIALOG", 500);
_button ctrlEnable false;

_list = DIALOG("X_RD_DIALOG", 100);

{
    _progress = [_x, "progress"] call FUNC(THIS_MODULE,item);
    _time = [_x, "time"] call FUNC(THIS_MODULE,item);

    _list lbAdd (if (_progress select 0 > 0) then {[_x] call FUNC(vehicle,name)} else {"-- UNKNOWN --"});
    _list lbSetData [_forEachIndex, _x];
    _list lbSetValue [_forEachIndex, (_time select 1) + _forEachIndex];

    _color = [1, 1, 1, 0.6];

    if (((_progress select 0) + 1) == _progress select 1) then {
        _color = [1, 1, 0, 0.8];
    };

    if (_progress select 0 >= _progress select 1) then {
        _color = [0, 1, 0, 0.8];
    };

    _list lbSetColor [_forEachIndex, _color];
} forEach GVAR(base_rd_type_vehicles);

lbSortByValue (DIALOG("X_RD_DIALOG", 100));