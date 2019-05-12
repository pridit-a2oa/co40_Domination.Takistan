#include "x_macros.sqf"

player setVariable [QGVAR(repair_kits), player getVariable QGVAR(repair_kits_max), true];

[nil, player, rSay, QGVAR(sound_shuffle), 20] call RE;