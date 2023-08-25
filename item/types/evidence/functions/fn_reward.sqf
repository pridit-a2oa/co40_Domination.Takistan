#include "x_macros.sqf"
private ["_item"];

PARAMS_1(_item);

if !([_item] call FUNC(item,valid)) exitWith {};

player removeWeapon _item;

if !(isNil QMODULE(reward)) then {
    [
        player,
        GVAR(item_evidence_score),
        "retrieving intel"
    ] call FUNC(reward,score);
};