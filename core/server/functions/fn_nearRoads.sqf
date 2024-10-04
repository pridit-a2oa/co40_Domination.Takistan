#include "x_macros.sqf"
private ["_position", "_radius", "_roads"];

PARAMS_2(_position, _radius);

_roads = [];

{
    if !([str _x, "invisible"] call KRON_StrInStr || {[str _x, "runway"] call KRON_StrInStr}) then {
        [_roads, _x] call BIS_fnc_arrayPush;
    };
} forEach (_position nearRoads _radius);

_roads