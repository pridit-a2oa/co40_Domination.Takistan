#include "x_macros.sqf"

disableSerialization;

lbClear (DIALOG("X_SETTING_DIALOG", 300));

DIALOG("X_SETTING_DIALOG", 200) ctrlSetText "";
DIALOG("X_SETTING_DIALOG", 500) ctrlSetText "";
DIALOG("X_SETTING_DIALOG", 600) ctrlSetText "";

DIALOG("X_SETTING_DIALOG", 300) ctrlShow false;
DIALOG("X_SETTING_DIALOG", 400) ctrlShow false;
DIALOG("X_SETTING_DIALOG", 500) ctrlShow false;