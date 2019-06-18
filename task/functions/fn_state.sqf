#include "x_macros.sqf"
private ["_task", "_state"];

PARAMS_2(_task, _state);

{
    if (_x select 0 == _task) exitWith {
        _x set [3, _state];
    };
} forEach (X_JIPH getVariable QGVAR(tasks));

X_JIPH setVariable [QGVAR(tasks), X_JIPH getVariable QGVAR(tasks), true];