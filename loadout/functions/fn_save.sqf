#define THIS_MODULE loadout
#include "x_macros.sqf"
private ["_weapons"];

_weapons = switch (true) do {
    case !(isNil QMODULE(item)): {
        [weapons player] __submodulePP(item);
    };

    default {
        weapons player
    };
};

GVAR(loadout) = [
    _weapons,
    magazines player,
    typeOf (unitBackpack player)
];