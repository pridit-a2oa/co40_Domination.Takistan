#include "x_macros.sqf"
private ["_ied"];

_ied = _this select 3;

_ied setVariable [QGVAR(disarm), true, true];

if !([] call FUNC(client,stall)) exitWith {
    _ied setVariable [QGVAR(disarm), false, true];
};

[true, "say3D", [player, QGVAR(sound_disarm), 20]] call FUNC(network,mp);

deleteVehicle _ied;

if !(isNil QMODULE(reward)) then {
    [
        player,
        GVAR(ied_amount_score),
        "defusing an IED"
    ] call FUNC(reward,score);
};

if !(isNil QMODULE(database)) then {
    [gameLogic, "execVM", [[getPlayerUID player, 4], FUNCTION(database,statistic)]] call FUNC(network,mp);
};