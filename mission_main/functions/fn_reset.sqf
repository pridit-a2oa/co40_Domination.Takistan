#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(camps), 0];
_target setVariable [QGVAR(radios), 0];

_target setVariable [QGVAR(cleanup), []];
_target setVariable [QGVAR(tasks), []];

_target setVariable [QGVAR(detected), false];