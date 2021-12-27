#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (!alive player) exitWith {false};
if (!alive _target) exitWith {false};
if (!(_target getVariable QGVAR(unconscious))) exitWith {false};
if (player getVariable QGVAR(unconscious)) exitWith {false};

true