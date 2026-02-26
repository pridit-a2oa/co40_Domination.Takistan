#include "x_macros.sqf"
private ["_identifier", "_count"];

_identifier = [_this, 1, [getPlayerUID player, name player]] call FUNC(common,param);

_count = 0;

if !(isServer) exitWith {
    count (player getVariable QGVAR(perks_unlocked));
};

{
    if ([_identifier, [getPlayerUID _x, name _x]] call BIS_fnc_areEqual) exitWith {
        _count = count (_x getVariable QGVAR(perks_unlocked));
    };
} forEach (call FUNC(common,players));

_count