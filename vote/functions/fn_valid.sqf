#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_votes"];

if ([X_JIPH getVariable QGVAR(vote), ""] call BIS_fnc_areEqual) exitWith {false};

_votes = {[_x, true] call BIS_fnc_areEqual} count ([1, X_JIPH getVariable QGVAR(votes)] call FUNC(common,arrayValues));

if (_votes < (X_JIPH getVariable QGVAR(vote_players))) exitWith {false};

true