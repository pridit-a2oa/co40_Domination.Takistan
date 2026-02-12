/**
 * Task Module (Handler)
 */

#define THIS_MODULE task
#include "x_macros.sqf"

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIP getVariable QGVAR(tasks)}};

    {
        private ["_task"];

        _task = if !(isNil {_x select 4}) then {
            player createSimpleTask [_x select 0, [_x select 4] call FUNC(task,get)];
        } else {
            player createSimpleTask [_x select 0];
        };

        if ([typeName (_x select 1), "ARRAY"] call BIS_fnc_areEqual) then {
            _task setSimpleTaskDestination (_x select 1);
        };

        _task setSimpleTaskDescription (_x select 2);
        _task setTaskState (_x select 3);

        sleep 0.1;
    } forEach (X_JIP getVariable QGVAR(tasks));
};