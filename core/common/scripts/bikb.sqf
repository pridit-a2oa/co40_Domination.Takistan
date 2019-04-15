/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf";
private ["_group"];

if (isServer) then {
    _group = createGroup west;
    
    GVAR(crossroad) = _group createUnit ["Logic", [0,0,100], [], 0, "none"]; 
    [GVAR(crossroad)] joinSilent _group;
    GVAR(crossroad) enableSimulation false;
    
    X_JIPH setVariable [QGVAR(crossroad), GVAR(crossroad)];
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(crossroad)}};
    
    GVAR(crossroad) = X_JIPH getVariable QGVAR(crossroad);
};

GVAR(crossroad) kbAddTopic ["HQ", "core\common\sentences.bikb"];
GVAR(crossroad) setIdentity "DHQ_EN1";
GVAR(crossroad) setRank "COLONEL";
GVAR(crossroad) setGroupId ["Crossroad"];

player kbAddTopic ["HQ", "core\common\sentences.bikb"];