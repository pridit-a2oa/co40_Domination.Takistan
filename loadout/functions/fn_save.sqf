#define THIS_MODULE loadout
#include "x_macros.sqf"
private ["_weapons", "_magazines"];

_weapons = if !(isNil QMODULE(gear)) then {
    [
        weapons player,
        "weapon",
        "saved"
    ] call FUNC(gear,items)
} else {
    weapons player
};

_magazines = if !(isNil QMODULE(gear)) then {
    [
        magazines player,
        "magazine"
    ] call FUNC(gear,items)
} else {
    magazines player
};

GVAR(loadout) = [
    _weapons,
    _magazines,
    typeOf (unitBackpack player)
];