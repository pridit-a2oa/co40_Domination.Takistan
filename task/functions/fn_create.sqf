#include "x_macros.sqf"
private ["_name", "_position", "_description", "_state", "_parent", "_task"];

PARAMS_5(_name, _position, _description, _state, _parent);

if (hasInterface) then {
    if !([{[_description, taskDescription _x] call BIS_fnc_areEqual} count (simpleTasks player), 0] call BIS_fnc_areEqual) exitWith {};

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
};

if (isServer) then {
    X_JIP setVariable [QGVAR(tasks), (X_JIP getVariable QGVAR(tasks)) + [_this], true];
};

sleep 0.1;