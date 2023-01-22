#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_type);

{
    if (_x find _type != -1) exitWith {
        _type = _x select 1;
    };
} forEach GVAR(construction_types);

_type