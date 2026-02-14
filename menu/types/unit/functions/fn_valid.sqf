#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

if !(alive _unit) exitWith {false};
if (player distance _unit > 2.5) exitWith {false};
if !([] call FUNC(common,ready)) exitWith {false};
if !(player getVariable QGVAR(idle)) exitWith {false};

true