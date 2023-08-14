#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_state", "_vote"];

PARAMS_1(_state);

_vote = X_JIPH getVariable QGVAR(vote);

[true, "spawn", [[_state, _vote], {
    if !(hasInterface) exitWith {};

    _this call FUNC(THIS_MODULE,hint);

    if !([_this select 0, "cancel"] call BIS_fnc_areEqual) then {
        player setVariable [QGVAR(vote_cooldown), time + GVAR(vote_time_cooldown)];
    };
}]] call FUNC(network,mp);

if ([_state, "pass"] call BIS_fnc_areEqual) then {
    call compile (gameLogic getVariable QGVAR(vote));
};

call FUNC(THIS_MODULE,reset);

__log format ["Ended %1 [%2]", _vote, toUpper _state]];