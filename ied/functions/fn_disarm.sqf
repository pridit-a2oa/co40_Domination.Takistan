#include "x_macros.sqf"
private ["_ied"];

_ied = _this select 3;

_ied setVariable [QGVAR(disarm), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 7;

if (!alive player || {lifeState player == "UNCONSCIOUS"}) exitWith {
    _ied setVariable [QGVAR(disarm), false, true];
};

[true, "say", [player, QGVAR(sound_disarm), 20]] call FUNC(network,mp);

deleteVehicle _ied;