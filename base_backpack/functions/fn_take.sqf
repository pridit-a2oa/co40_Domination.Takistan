#include "x_macros.sqf"

removeBackpack player;

player addBackpack (_this select 3) select 0;

[true, "say", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);

clearMagazineCargo (unitBackpack player);