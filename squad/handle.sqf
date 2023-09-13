/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (isServer) then {
    __fsm(watcher);
};

if (hasInterface) then {
    waitUntil {
        sleep 0.1;

        [count (X_JIPH getVariable QGVAR(squads)), count GVAR(group_names)] call BIS_fnc_areEqual && {[{[grpNull, _x] call BIS_fnc_areEqual} count (X_JIPH getVariable QGVAR(squads)), 0] call BIS_fnc_areEqual}
    };
    
    [call FUNC(THIS_MODULE,assign)] call FUNC(THIS_MODULE,populate);
};