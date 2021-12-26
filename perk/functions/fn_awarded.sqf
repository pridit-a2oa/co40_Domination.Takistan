#include "x_macros.sqf"
private ["_amount"];

PARAMS_1(_amount);

if (!isNil QMODULE(reward)) then {
	["perk", _amount, [0.941, 0.902, 0.549]] call FUNC(reward,alert);
};

if (isNil QMODULE(setting) || {(player getVariable QGVAR(sounds) select 1 == 0)}) exitWith {};

playSound QGVAR(sound_impressive);