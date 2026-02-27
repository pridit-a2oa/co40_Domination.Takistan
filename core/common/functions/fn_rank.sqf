#include "x_macros.sqf"
private ["_string"];

PARAMS_1(_string);

_rank = toArray (toLower _string);
_rank set [0, toArray (toUpper toString [_rank select 0]) select 0];

toString _rank