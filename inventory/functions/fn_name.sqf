#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

{
    if (_x select 1 == _type) exitWith {
        _x select 0
    };
} forEach GVAR(inventory_types);