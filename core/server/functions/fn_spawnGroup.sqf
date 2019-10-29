#include "x_macros.sqf"
private ["_position", "_side", "_type"];

PARAMS_3(_position, _side, _type);

_group = [_position, _side, _type] call BIS_fnc_spawnGroup;

{
    if (faction _x == "BIS_US") then {
        _x addEventHandler ["HandleDamage", {0}];
    } else {
        __addDead(_x);
    };
} forEach (units _group);

_group allowFleeing 0;

_group