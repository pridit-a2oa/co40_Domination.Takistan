#include "x_macros.sqf"
private ["_type", "_amount", "_color"];

PARAMS_3(_type, _amount, _color);

if (!isNil QMODULE(setting) && {[(player getVariable QGVAR(reward)) select 1, 0] call BIS_fnc_areEqual}) exitWith {false};

disableSerialization;

40111 cutRsc ["XD_Reward", "PLAIN"];

DIALOG("X_REWARD_DIALOG", 100) ctrlSetTextColor [_color select 0, _color select 1, _color select 2, 1];
DIALOG("X_REWARD_DIALOG", 200) ctrlSetText (str _amount);
DIALOG("X_REWARD_DIALOG", 300) ctrlSetText format [
    "You have been rewarded %1 point(s)",
    _type
];