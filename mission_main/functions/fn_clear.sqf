#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (_target getVariable QGVAR(camps) > 0) exitWith {false};
if (_target getVariable QGVAR(antennas) > 0) exitWith {false};

true