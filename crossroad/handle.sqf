/**
 * Crossroad Module (Handler)
 */

#define THIS_MODULE crossroad
#include "x_macros.sqf"
private ["_group"];

if (isServer) then {
    _group = createGroup west;
    
    GVAR(crossroad) = _group createUnit ["Logic", [0,0,0], [], 0, "NONE"]; 
    [GVAR(crossroad)] joinSilent _group;
    GVAR(crossroad) enableSimulation false;
    
    _group = createGroup west;
    
    GVAR(crossroad2) = _group createUnit ["Logic", [0,0,1], [], 0, "NONE"]; 
    [GVAR(crossroad2)] joinSilent _group;
    GVAR(crossroad2) enableSimulation false;
    
    X_JIPH setVariable [QGVAR(crossroad), GVAR(crossroad), true];
    X_JIPH setVariable [QGVAR(crossroad2), GVAR(crossroad2), true];
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(crossroad2)}};
    
    GVAR(crossroad) = X_JIPH getVariable QGVAR(crossroad);
    GVAR(crossroad2) = X_JIPH getVariable QGVAR(crossroad2);
    
    player kbAddTopic ["HQ", __bikb];
};

GVAR(crossroad) kbAddTopic ["HQ", __bikb];
GVAR(crossroad) setIdentity "DHQ_EN1";
GVAR(crossroad) setRank "COLONEL";
GVAR(crossroad) setGroupId ["Crossroad"];

GVAR(crossroad2) kbAddTopic ["HQ", __bikb];
GVAR(crossroad2) setIdentity "DHQ_EN2";
GVAR(crossroad2) setRank "COLONEL";
GVAR(crossroad2) setGroupId ["Crossroad1"];

if (!isNil QMODULE(mission_main)) then {
    __submoduleVM(mission_main);
};

if (!isNil QMODULE(uav)) then {
    __submoduleVM(uav);
};