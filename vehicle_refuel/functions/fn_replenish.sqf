#include "x_macros.sqf"

player setVariable [QGVAR(fuel_cans), player getVariable QGVAR(fuel_cans_max), true];

[true, "say3D", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);