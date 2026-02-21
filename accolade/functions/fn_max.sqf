#include "x_macros.sqf"
private ["_max"];

_max = 0;

{
    if !([_x select 1, -1] call BIS_fnc_areEqual) then {
        _max = _max + (_x select 1);
    };
} forEach GVAR(accolade_types_proficiency);

(_max * count GVAR(accolade_types))