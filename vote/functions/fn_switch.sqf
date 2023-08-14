#include "x_macros.sqf"
private ["_type", "_subtype"];

PARAMS_1(_idc);

disableSerialization;

lbClear 301;

DIALOG("X_VOTE_DIALOG", 301) ctrlShow true;

_type = GVAR(vote_types) select (lbCurSel 300);
_subtype = DIALOG("X_VOTE_DIALOG", 301);

{
    _subtype lbAdd (_x select 0);
} forEach (_type select 1);

lbSetCurSel [301, 0];

DIALOG("X_VOTE_DIALOG", 500) ctrlEnable true;