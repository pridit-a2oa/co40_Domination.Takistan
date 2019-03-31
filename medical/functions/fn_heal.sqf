#include "x_macros.sqf"
private ["_sound", "_perk"];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 1.5;
[nil, player, rSay, QGVAR(sound_tear), 20] call RE;

sleep 5;
player setDamage 0;

if (!isNil QMODULE(perk)) then {
    player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) - 1, true];
};