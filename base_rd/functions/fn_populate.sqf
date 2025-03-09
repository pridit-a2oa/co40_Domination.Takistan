#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_clear", "_button", "_list"];

PARAMS_1(_clear);

disableSerialization;

if (!isNil "_clear" && {_clear}) then {
    lbClear 100;
};

_button = DIALOG("X_RD_DIALOG", 1000);
_button ctrlEnable false;

_list = DIALOG("X_RD_DIALOG", 100);

{
    private ["_progress", "_time", "_type"];

    _progress = [_x, "progress"] call FUNC(THIS_MODULE,item);
    _time = [_x, "time"] call FUNC(THIS_MODULE,item);

    _type = [_x] call FUNC(vehicle,type);

    if (_progress select 0 > 0) then {
        _list lbAdd ([_x] call FUNC(vehicle,name));

        _list lbSetPicture [
            _forEachIndex,
            _type select 1
        ];

        _list lbSetValue [
            _forEachIndex,
            parseNumber format [
                "-%1%2%3",
                if ([_progress select 0, _progress select 1] call BIS_fnc_areEqual) then {2} else {1},
                _progress select 0,
                (_time select 1) + _forEachIndex
            ]
        ];
    } else {
        _list lbAdd (format ["[Unknown %1]", _type select 0]);
        _list lbSetValue [_forEachIndex, 0];
    };

    _list lbSetData [_forEachIndex, _x];
} forEach GVAR(base_rd_type_vehicles);

lbSortByValue (DIALOG("X_RD_DIALOG", 100));