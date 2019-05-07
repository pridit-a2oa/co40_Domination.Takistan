#include "x_macros.sqf"

{
    player setVariable [_x, 0]
} forEach [
    QGVAR(head_hit),
    QGVAR(body),
    QGVAR(legs),
    QGVAR(hands),
    QGVAR(overall)
];

player setUnconscious false;
player setVariable [QGVAR(unconscious), false, true];