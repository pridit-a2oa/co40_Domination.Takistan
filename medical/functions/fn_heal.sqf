#include "x_macros.sqf"
private ["_sound", "_perk"];

GVAR(healing) = true;

if ([[false], ["AinvPknlMstpSnonWnonDnon_healed_2", ""]] call FUNC(client,stall)) then {
    if (!isNil QMODULE(inventory_medical) && {[player getVariable QGVAR(inventory_medical), 0] call BIS_fnc_areEqual}) exitWith {};

    player setDamage 0;

    if !(isNil QMODULE(damage)) then {
        player setVariable [QGVAR(structure), 0];
    };

    if !(isNil QMODULE(inventory_medical)) then {
        player setVariable [QGVAR(inventory_medical), (player getVariable QGVAR(inventory_medical)) - 1, true];
    };
};

GVAR(healing) = false;