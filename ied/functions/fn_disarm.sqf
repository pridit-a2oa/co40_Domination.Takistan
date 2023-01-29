#include "x_macros.sqf"
private ["_ied"];

_ied = _this select 3;

_ied setVariable [QGVAR(disarm), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 2;

if (alive player) then {
    [true, "switchMove", [player, "AinvPknlMstpSlayWrflDnon_medic"]] call FUNC(network,mp);
};

sleep 5;

if (!alive player || {player getVariable QGVAR(unconscious)}) exitWith {
    _ied setVariable [QGVAR(disarm), false, true];
};

[true, "say3D", [player, QGVAR(sound_disarm), 20]] call FUNC(network,mp);

deleteVehicle _ied;

[gameLogic, "addScore", [player, GVAR(ied_amount_score)]] call FUNC(network,mp);

systemChat format [
    "You have been given %1 score for disarming an IED",
    GVAR(ied_amount_score)
];

playSound "beep";