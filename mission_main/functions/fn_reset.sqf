#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(antennas), 0];
_target setVariable [QGVAR(camps), 0];
_target setVariable [QGVAR(cleanup), []];
_target setVariable [QGVAR(spotted), false];
_target setVariable [QGVAR(tasks), []];