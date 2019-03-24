#include "x_macros.sqf"

GVAR(loadout) = [
    weapons player,
    magazines player,
    typeOf (unitBackpack player)
];