#include "x_macros.sqf"
private ["_amount", "_awarded"];

PARAMS_1(_amount);

disableSerialization;

40111 cutRsc ["XD_Awarded", "PLAIN"];

_awarded = DIALOG("X_AWARD_DIALOG", 1001);
_awarded ctrlSetText (str _amount);

if (isNil QMODULE(setting) || {(player getVariable QGVAR(sounds) select 1 == 0)}) exitWith {};

playSound QGVAR(sound_impressive);