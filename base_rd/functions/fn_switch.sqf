#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_selected", "_button", "_vehicle", "_progress", "_time"];

PARAMS_1(_selected);

disableSerialization;

_button = DIALOG("X_RD_DIALOG", 500);
_button ctrlEnable false;

_vehicle = DIALOG("X_RD_DIALOG", 100) lbData _selected;

_progress = [_vehicle, "progress"] call FUNC(THIS_MODULE,item);
_time = [_vehicle, "time"] call FUNC(THIS_MODULE,item);

DIALOG("X_RD_DIALOG", 200) ctrlSetText (
    if (_progress select 0 > 0) then {
        getText (configFile >> "cfgVehicles" >> _vehicle >> "picture")
    } else {
        "\ca\ui\data\marker_question_ca"
    }
);

DIALOG("X_RD_DIALOG", 300) ctrlSetText (
    if (_progress select 0 > 0) then {
        format ["%1/%2", _progress select 0, _progress select 1]
    } else {
        "?"
    }
);

DIALOG("X_RD_DIALOG", 400) ctrlSetText (
    if (_progress select 0 >= _progress select 1) then {
        [_time select 0] call FUNC(common,displayTime)
    } else {
        "?"
    }
);

if (_progress select 0 >= _progress select 1) then {
    _button ctrlEnable true;
};