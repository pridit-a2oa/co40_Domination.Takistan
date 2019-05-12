/**
 * Task Module (Handler)
 */

#define THIS_MODULE task
#include "x_macros.sqf"

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(tasks)}};
    
    {
        _task = if (!isNil {_x select 4}) then {
            player createSimpleTask [_x select 0, _x select 4];
        } else {
            player createSimpleTask [_x select 0];
        };
        
        _task setSimpleTaskDestination (_x select 1);
        _task setSimpleTaskDescription (_x select 2);
        _task setTaskState (_x select 3);
    } forEach (X_JIPH getVariable QGVAR(tasks));
};