#include "x_macros.sqf"
private ["_sound", "_perk"];

GVAR(healing) = true;

if !(isNil QMODULE(inventory_medical)) then {
    player setVariable [QGVAR(medkits), (player getVariable QGVAR(medkits)) - 1, true];
};

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 2;

if (alive player) then {
    [true, "switchMove", [player, "AinvPknlMstpSlayWrflDnon_medic"]] call FUNC(network,mp);
};

sleep 5;

if (alive player) then {
    player setDamage 0;
};

GVAR(healing) = false;