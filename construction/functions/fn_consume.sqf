#include "x_macros.sqf"
private ["_amount", "_cooldown"];

PARAMS_2(_amount, _cooldown);

player setVariable [format [QUOTE(%1), _amount], (player getVariable (format [QUOTE(%1), _amount])) - 1];
player setVariable [format [QUOTE(%1), _cooldown], time + (call compile _cooldown)];