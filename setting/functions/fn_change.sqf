#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_setting", "_id", "_data", "_type", "_value"];

PARAMS_2(_setting, _id);

{
    if (_forEachIndex == _id) exitWith {
        _data = DIALOG("X_SETTING_DIALOG", 200 + _forEachIndex) lbData (_setting select 1);
        _value = if (_data != "") then {_data} else {_setting select 1};
        
        _type = [_x select 1] call FUNC(THIS_MODULE,type);
        
        if (typeName _type == "ARRAY") then {
            (call compile format ["%1 %2", _type select 0, _value]);
        };
        
        missionNamespace setVariable [format ["d_%1", _x select 1], _setting select 1];
    };
} forEach GVAR(setting_type_valid);