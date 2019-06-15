#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_name);

_tasks = [];

{
    if (_x select 0 != _name) then {
        _tasks = _tasks + [_x];
    };
} forEach (X_JIPH getVariable QGVAR(tasks));

X_JIPH setVariable [QGVAR(tasks), _tasks, true];