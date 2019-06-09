#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_setting"];

disableSerialization;

createDialog "XD_SettingDialog";

for "_i" from 0 to GVAR(setting_amount_options) do {
    DIALOG("X_SETTING_DIALOG", 200 + _i) ctrlShow false;
    DIALOG("X_SETTING_DIALOG", 300 + _i) ctrlShow false;
};

{
    _setting = _x;
    _index = _forEachIndex;
    
    DIALOG("X_SETTING_DIALOG", 100 + _forEachIndex) ctrlSetText (_x select 0);

    if (!isNil {_x select 3}) then {
        DIALOG("X_SETTING_DIALOG", 200 + _forEachIndex) ctrlShow true;
        
        {
            DIALOG("X_SETTING_DIALOG", 200 + _index) lbAdd _x;
            DIALOG("X_SETTING_DIALOG", 200 + _index) lbSetData [_forEachIndex, (str ((_setting select 3) select _forEachIndex))];
        } forEach (_x select 2);
        
        DIALOG("X_SETTING_DIALOG", 200 + _forEachIndex) lbSetCurSel (missionNamespace getVariable (format ["d_%1", _setting select 1]));
    } else {
        DIALOG("X_SETTING_DIALOG", 300 + _forEachIndex) ctrlShow true;
        DIALOG("X_SETTING_DIALOG", 300 + _forEachIndex) sliderSetRange [(_x select 2) select 0, (_x select 2) select 1];
        DIALOG("X_SETTING_DIALOG", 300 + _forEachIndex) sliderSetPosition (call compile format ["%1", ([_x select 1] call FUNC(THIS_MODULE,type)) select 1]);
    };
} forEach GVAR(setting_type_valid);

// 