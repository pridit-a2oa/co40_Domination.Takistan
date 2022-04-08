/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (isServer) then {
    __fsm(watcher);
};

if (hasInterface) then {    
    waitUntil {count (X_JIPH getVariable QGVAR(groups)) == count GVAR(group_names) && {{[grpNull, _x] call BIS_fnc_areEqual} count (X_JIPH getVariable QGVAR(groups)) == 0}};
    
    [call FUNC(THIS_MODULE,assign)] call FUNC(THIS_MODULE,populate);
};