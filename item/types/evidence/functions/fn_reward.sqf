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

if !(isNil QMODULE(statistic)) then {
    [gameLogic, "execVM", [[6, [getPlayerUID player, name player]], FUNCTION(statistic,set)]] call FUNC(network,mp);
};