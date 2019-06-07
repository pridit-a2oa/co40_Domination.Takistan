#include "x_macros.sqf"
private ["_awarded"];

disableSerialization;

40111 cutRsc ["XD_Awarded", "PLAIN"];

_awarded = DIALOG("X_AWARD_DIALOG", 1001);
_awarded ctrlSetText (str GVAR(perk_amount_points));

DIALOG("X_AWARD_DIALOG", 1200) ctrlSetTextColor [0.5, 0.5, 0.5, 1];