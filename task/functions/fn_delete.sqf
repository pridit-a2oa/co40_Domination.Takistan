#include "x_macros.sqf"
private ["_name", "_tasks"];

PARAMS_1(_name);

_tasks = [];

{
    if !([_x select 0, _name] call BIS_fnc_areEqual) then {
        [_tasks, _x] call BIS_fnc_arrayPush;
    };
} forEach (X_JIPH getVariable QGVAR(tasks));

X_JIPH setVariable [QGVAR(tasks), _tasks, true];