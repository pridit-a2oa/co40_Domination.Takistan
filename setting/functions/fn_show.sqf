#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_setting"];

disableSerialization;

createDialog "XD_SettingDialog";

{
    DIALOG("X_SETTING_DIALOG", 100) lbAdd (_x select 0);
    DIALOG("X_SETTING_DIALOG", 100) lbSetData [_forEachIndex, _x select 1];

    call FUNC(THIS_MODULE,hide);
} forEach GVAR(setting_type_valid);

lbSort (DIALOG("X_SETTING_DIALOG", 100));

DIALOG("X_SETTING_DIALOG", 100) lbSetCurSel 0;