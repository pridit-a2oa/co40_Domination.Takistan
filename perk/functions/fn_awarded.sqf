#include "x_macros.sqf"
private ["_amount"];

PARAMS_1(_amount);

if (!isNil QMODULE(reward)) then {
    ["perk", _amount, [0.643, 0.5742, 0.4102]] call FUNC(reward,alert);
};

if (!isNil QMODULE(setting) && {[(player getVariable QGVAR(sounds)) select 1, 0] call BIS_fnc_areEqual}) exitWith {};

playSound QGVAR(sound_impressive);