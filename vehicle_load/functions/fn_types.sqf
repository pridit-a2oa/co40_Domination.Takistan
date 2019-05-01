#include "x_macros.sqf"
private ["_aircraft", "_types"];

PARAMS_1(_aircraft);

_types = [];

{
    if (!isNil {_x select 0}) then {
        _types = _types + [_x select 0];
    } else {
        _types = _types + [_x];
    };
} forEach (_aircraft getVariable QGVAR(loaded));

_types