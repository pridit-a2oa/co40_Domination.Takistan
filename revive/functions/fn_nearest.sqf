#include "x_macros.sqf"
private ["_distances", "_distance", "_nearest", "_player"];

_distances = [];

{
    if (alive _x) then {
        if (_x getVariable QGVAR(unconscious)) exitWith {};
        if (_x distance player > GVAR(revive_distance_exclaim)) exitWith {};
        if (_x distance player > 35 && {!(_x in units (group player))}) exitWith {};

        _distances = _distances + [[_x, player distance _x]];
    };
} forEach (call FUNC(common,players));

if ([_distances, []] call BIS_fnc_areEqual) exitWith {false};

_distance = ([1, _distances] call FUNC(common,arrayValues)) call BIS_fnc_lowestNum;
_nearest = ([1, _distances] call FUNC(common,arrayValues)) find _distance;

_player = (_distances select _nearest) select 0;

if (player distance _player < 5) exitWith {false};
if (player distance _player < 35) exitWith {player};

_player