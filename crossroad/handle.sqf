/**
 * Crossroad Module (Handler)
 */

#define THIS_MODULE crossroad
#include "x_macros.sqf"
private ["_group"];

if (isServer) then {
    _group = createGroup west;
    
    GVAR(crossroad) = _group createUnit ["Logic", [0,0,100], [], 0, "none"]; 
    [GVAR(crossroad)] joinSilent _group;
    GVAR(crossroad) enableSimulation false;
    
    X_JIPH setVariable [QGVAR(crossroad), GVAR(crossroad), true];
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(crossroad)}};
    
    GVAR(crossroad) = X_JIPH getVariable QGVAR(crossroad);
    
    player kbAddTopic ["HQ", __bikb];
};

GVAR(crossroad) kbAddTopic ["HQ", __bikb];
GVAR(crossroad) setIdentity "DHQ_EN1";
GVAR(crossroad) setRank "COLONEL";
GVAR(crossroad) setGroupId ["Crossroad"];