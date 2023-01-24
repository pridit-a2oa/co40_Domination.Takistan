/**
 * Conversation Module (Handler)
 */

#define THIS_MODULE conversation
#include "x_macros.sqf"
private ["_path"];

if (isServer) then {
    private ["_group"];
    
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

_path = format ["%1\speech\crossroad.bikb", QUOTE(THIS_MODULE)];

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(crossroad2)}};
    
    GVAR(crossroad) = X_JIPH getVariable QGVAR(crossroad);
    GVAR(crossroad2) = X_JIPH getVariable QGVAR(crossroad2);
    
    player kbAddTopic ["HQ", _path];
};

GVAR(crossroad) kbAddTopic ["HQ", _path];
GVAR(crossroad) setIdentity "DHQ_EN1";
GVAR(crossroad) setRank "COLONEL";
GVAR(crossroad) setGroupId ["Crossroad"];

GVAR(crossroad2) kbAddTopic ["HQ", _path];
GVAR(crossroad2) setIdentity "DHQ_EN2";
GVAR(crossroad2) setRank "COLONEL";
GVAR(crossroad2) setGroupId ["Crossroad1"];

{
    if !(isNil (format [QMODULE(%1), _x])) then {
        _path = format ["%1\speech\%2.bikb", QUOTE(THIS_MODULE), _x];

        if (hasInterface) then {
            player kbAddTopic [_x, _path];
        };

        GVAR(crossroad) kbAddTopic [_x, _path];
        GVAR(crossroad2) kbAddTopic [_x, _path];
    };
} forEach [
    "airtaxi",
    "base_rd",
    "base_wreck",
    "bomber",
    "mission_main",
    "mission_mini",
    "uav",
    "vehicle_deploy",
    "vehicle_lift"
];