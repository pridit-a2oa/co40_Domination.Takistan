#include "x_macros.sqf"
private ["_magazines"];

PARAMS_1(_weapon);

_magazines = [];

{
    if (_x == (_weapon select 3)) then {
        _magazines = _magazines + [_x];
    };
} forEach (magazines player);

_magazines