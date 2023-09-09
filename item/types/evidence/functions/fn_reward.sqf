#include "x_macros.sqf"
private ["_item"];

PARAMS_1(_item);

if !([_item] call FUNC(item,consume)) exitWith {};

if !(isNil QMODULE(reward)) then {
    [
        player,
        GVAR(item_evidence_score),
        "retrieving intel"
    ] call FUNC(reward,score);
};