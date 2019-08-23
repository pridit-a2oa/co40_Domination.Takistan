#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(detected), false];

_target setVariable [QGVAR(camps), [], true];
_target setVariable [QGVAR(radios), [], true];

_target setVariable [QGVAR(cleanup), []];
_target setVariable [QGVAR(tasks), []];

if (!isNil QMODULE(ied)) then {
    _target setVariable [QGVAR(ieds), []];
};