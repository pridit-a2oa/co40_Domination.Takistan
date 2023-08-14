#define THIS_MODULE vote
#include "x_macros.sqf"

gameLogic setVariable [QGVAR(vote), ""];
gameLogic setVariable [QGVAR(vote_reminded), false];
gameLogic setVariable [QGVAR(vote_time), 0];

X_JIPH setVariable [QGVAR(vote), "", true];
X_JIPH setVariable [QGVAR(vote_players), -1, true];
X_JIPH setVariable [QGVAR(vote_progress), false, true];

X_JIPH setVariable [QGVAR(votes), [], true];

[true, "spawn", [[], {
    if !(hasInterface) exitWith {};
    
    GVAR(vote) = false;

    [false] call FUNC(THIS_MODULE,refresh);
}]] call FUNC(network,mp);