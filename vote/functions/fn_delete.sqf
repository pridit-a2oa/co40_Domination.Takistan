#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_uid", "_vote", "_count"];

PARAMS_1(_uid);

if ([X_JIPH getVariable QGVAR(vote), ""] call BIS_fnc_areEqual) exitWith {};

// Cancel vote if new player count does not meet minimum
if (count (call FUNC(common,players)) < GVAR(vote_amount_players)) exitWith {
    ["cancel"] call FUNC(THIS_MODULE,complete);
};

_vote = [X_JIPH getVariable QGVAR(votes), _uid] call BIS_fnc_findNestedElement;

if !([_vote, []] call BIS_fnc_areEqual) then {
    // Delete individual player vote
    X_JIPH setVariable [
        QGVAR(votes),
        [X_JIPH getVariable QGVAR(votes), _vote select 0] call FUNC(common,deleteAt),
        true
    ];
};

_count = call FUNC(THIS_MODULE,count);

// Update player vote criteria to a lower possible minimum
if (X_JIPH getVariable QGVAR(vote_players) > _count) then {
    X_JIPH setVariable [QGVAR(vote_players), _count, true];
};

[true] call FUNC(THIS_MODULE,refresh);