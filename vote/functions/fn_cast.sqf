#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_vote"];

PARAMS_1(_vote);

X_JIPH setVariable [
    QGVAR(votes),
    (X_JIPH getVariable QGVAR(votes)) + [
        [[name player, getPlayerUID player], _vote]
    ],
    true
];

[true] call FUNC(THIS_MODULE,refresh);