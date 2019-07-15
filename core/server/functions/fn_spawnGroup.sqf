#include "x_macros.sqf"
private ["_position", "_side", "_type"];

PARAMS_3(_position, _side, _type);

_group = [_position, _side, _type] call BIS_fnc_spawnGroup;

{    
    __addDead(_x);
} forEach (units _group);

_group