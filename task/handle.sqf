/**
 * Task Module (Handler)
 */

#define THIS_MODULE task
#include "x_macros.sqf"

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIP getVariable QGVAR(tasks)}};

    {
        _x call FUNC(task,create);
    } forEach (X_JIP getVariable QGVAR(tasks));
};