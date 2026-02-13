#include "x_macros.sqf"
private ["_task", "_state"];

PARAMS_2(_task, _state);

{
    if ([_x select 0, _task select 0] call BIS_fnc_areEqual) exitWith {
        _x set [3, _state];
    };
} forEach (X_JIP getVariable QGVAR(tasks));

X_JIP setVariable [QGVAR(tasks), X_JIP getVariable QGVAR(tasks), true];