#define THIS_MODULE setting
#include "x_macros.sqf"

_selected = DIALOG("X_SETTING_DIALOG", 100) lbData (lbCurSel 100);

GVAR(option) = {
    if (_x find _selected > 0) exitWith {
        _x
    };
} forEach GVAR(setting_type_valid);

call FUNC(THIS_MODULE,hide);

DIALOG("X_SETTING_DIALOG", 200) ctrlSetText (GVAR(option) select 0);

DIALOG("X_SETTING_DIALOG", 500) ctrlShow true;
DIALOG("X_SETTING_DIALOG", 500) ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><t size='1' valign='bottom'>%1</t>", GVAR(option) select 2];

if (!isNil QMODULE(profile)) then {
    DIALOG("X_SETTING_DIALOG", 700) ctrlSetText "Saves";

    if ([__profile(GVAR(option) select 1)] call FUNC(profile,valid)) then {
        DIALOG("X_SETTING_DIALOG", 800) ctrlSetText "\ca\ui\data\ui_task_done_ca";
    } else {
        DIALOG("X_SETTING_DIALOG", 800) ctrlSetText "\ca\ui\data\ui_task_failed_ca";
    };
};

if (!isNil {GVAR(option) select 4}) exitWith {
    DIALOG("X_SETTING_DIALOG", 300) ctrlShow true;
    
    {
        DIALOG("X_SETTING_DIALOG", 300) lbAdd _x;

        _value = (GVAR(option) select 4) select _forEachIndex;

        if (typeName _value == "STRING") then {
            DIALOG("X_SETTING_DIALOG", 300) lbSetData [_forEachIndex, _value];
        } else {
            DIALOG("X_SETTING_DIALOG", 300) lbSetValue [_forEachIndex, _value];
        };
    } forEach (GVAR(option) select 3);
    
    DIALOG("X_SETTING_DIALOG", 300) lbSetCurSel ((player getVariable (format ["d_%1", GVAR(option) select 1])) select 0);
};

_value = call compile format ["%1", ([GVAR(option) select 1] call FUNC(THIS_MODULE,type)) select 1];

_minimum = (GVAR(option) select 3) select 0;
_maximum = (GVAR(option) select 3) select 1;

DIALOG("X_SETTING_DIALOG", 400) ctrlShow true;
DIALOG("X_SETTING_DIALOG", 400) sliderSetRange [_minimum, _maximum];
DIALOG("X_SETTING_DIALOG", 400) sliderSetPosition _value;
DIALOG("X_SETTING_DIALOG", 400) sliderSetSpeed [_maximum / 20, _maximum / 100];
DIALOG("X_SETTING_DIALOG", 600) ctrlSetText (str (round _value));