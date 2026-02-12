/**
 * Conversation Module (Handler)
 */

#define THIS_MODULE conversation
#include "x_macros.sqf"
private ["_path"];

if (isServer) then {
    private ["_crossroad", "_crossroad2"];

    _crossroad = createGroup west;

    GVAR(crossroad) = _crossroad createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    [GVAR(crossroad)] joinSilent _crossroad;
    GVAR(crossroad) enableSimulation false;

    _crossroad2 = createGroup west;

    GVAR(crossroad2) = _crossroad2 createUnit ["Logic", [0,0,1], [], 0, "NONE"];
    [GVAR(crossroad2)] joinSilent _crossroad2;
    GVAR(crossroad2) enableSimulation false;

    X_JIP setVariable [QGVAR(crossroad), GVAR(crossroad), true];
    X_JIP setVariable [QGVAR(crossroad2), GVAR(crossroad2), true];
};

_path = format ["%1\speech\crossroad.bikb", QUOTE(THIS_MODULE)];

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIP getVariable QGVAR(crossroad2)}};

    GVAR(crossroad) = X_JIP getVariable QGVAR(crossroad);
    GVAR(crossroad2) = X_JIP getVariable QGVAR(crossroad2);

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
    private ["_path"];

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
    "mission_main",
    "mission_mini",
    "uav",
    "vehicle_bomber",
    "vehicle_deploy",
    "vehicle_lift"
];