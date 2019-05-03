#include "x_macros.sqf"
private ["_ied"];

_ied = _this select 3;

_ied setVariable [QGVAR(disarm), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 7;

[nil, player, rSay, QGVAR(sound_disarm), 20] call RE;

deleteVehicle _ied;