#include "x_macros.sqf"
private ["_amount", "_awarded"];

PARAMS_1(_amount);

disableSerialization;

40111 cutRsc ["XD_Awarded", "PLAIN"];

_awarded = DIALOG("X_AWARD_DIALOG", 1001);
_awarded ctrlSetText (str _amount);

playSound QGVAR(sound_impressive);