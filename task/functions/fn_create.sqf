#include "x_macros.sqf"
private ["_name", "_position", "_description", "_state", "_parent"];

PARAMS_5(_name, _position, _description, _state, _parent);

_task = if (!isNil "_parent") then {
    player createSimpleTask [_name, _parent];
} else {
    player createSimpleTask [_name];
};

_task setSimpleTaskDestination _position;
_task setSimpleTaskDescription _description;
_task setTaskState _state;

if (isServer) then {
    X_JIPH setVariable [QGVAR(tasks), (X_JIPH getVariable QGVAR(tasks)) + [_this], true];
};

_task