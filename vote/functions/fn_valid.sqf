#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_votes"];

if ([X_JIP getVariable QGVAR(vote), ""] call BIS_fnc_areEqual) exitWith {false};

_votes = {[_x, true] call BIS_fnc_areEqual} count ([1, X_JIP getVariable QGVAR(votes)] call FUNC(common,arrayValues));

if (_votes < (X_JIP getVariable QGVAR(vote_players))) exitWith {false};

true