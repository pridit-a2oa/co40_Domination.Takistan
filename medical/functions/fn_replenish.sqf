#include "x_macros.sqf"

player setVariable [QGVAR(medkits), player getVariable QGVAR(medkits_max), true];

[true, "say", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);