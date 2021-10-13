#include "x_macros.sqf"
private ["_entities"];

_entities = GVAR(mission_mini_cleanup);

if (count _entities < 1) exitWith {};

sleep GVAR(mission_mini_time_cleanup);

{
    if (_x isKindOf "AllVehicles" && {alive _x}) then {
        _x setDamage 1;
    };
    
    deleteVehicle _x;
} forEach _entities;

GVAR(mission_mini_cleanup) = [];