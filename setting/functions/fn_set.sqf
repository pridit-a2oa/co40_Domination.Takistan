#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_setting", "_idc", "_data", "_type", "_value"];

PARAMS_2(_setting, _idc);

_data = DIALOG("X_SETTING_DIALOG", _idc) lbData (_setting select 1);
_value = if (_data != "") then {_data} else {_setting select 1};

_type = [GVAR(option) select 1] call FUNC(THIS_MODULE,type);

if (typeName _type == "ARRAY") then {
    (call compile format ["%1 %2", _type select 0, _value]);
};

player setVariable [format ["d_%1", GVAR(option) select 1], [_setting select 1, _value]];

if (isNil {GVAR(option) select 4}) then {
    DIALOG("X_SETTING_DIALOG", 600) ctrlSetText (str (round (_setting select 1)));
};