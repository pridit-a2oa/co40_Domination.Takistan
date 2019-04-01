#include "x_macros.sqf"
private ["_sound", "_perk"];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 6;
player setDamage 0;

if (!isNil QMODULE(perk)) then {
    player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) - 1, true];
};