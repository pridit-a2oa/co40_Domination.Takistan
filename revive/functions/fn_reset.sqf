#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

showHUD true;

_unit setCaptive false;

{
    _unit setVariable [_x, 0, true];
} forEach [
    QGVAR(head_hit),
    QGVAR(body),
    QGVAR(legs),
    QGVAR(hands),
    QGVAR(overall)
];

_unit setVariable [QGVAR(unconscious), false, true];
_unit setVariable [QGVAR(reviving), false, true];