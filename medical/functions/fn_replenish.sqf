#include "x_macros.sqf"

player setVariable [QGVAR(medkits), player getVariable QGVAR(medkits_max), true];

[nil, player, rSay, QGVAR(sound_shuffle), 20] call RE;