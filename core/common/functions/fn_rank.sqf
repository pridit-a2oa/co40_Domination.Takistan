#include "x_macros.sqf"
private ["_unit", "_rank"];

PARAMS_1(_unit);

_rank = toArray (toLower (rank _unit));
_rank set [0, toArray (toUpper toString [_rank select 0]) select 0];

toString _rank