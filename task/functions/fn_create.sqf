#include "x_macros.sqf"
private ["_name", "_position", "_description", "_state", "_parent"];

PARAMS_5(_name, _position, _description, _state, _parent);

_task = if !(isNil "_parent") then {
    player createSimpleTask [_name, [_parent] call FUNC(task,get)];
} else {
    player createSimpleTask [_name];
};

if ([typeName _position, "ARRAY"] call BIS_fnc_areEqual) then {
    _task setSimpleTaskDestination [_position select 0, _position select 1, 0];
};

_task setSimpleTaskDescription _description;
_task setTaskState _state;

if (isServer) then {
    X_JIPH setVariable [QGVAR(tasks), (X_JIPH getVariable QGVAR(tasks)) + [_this], true];
};

sleep 0.1;

_this