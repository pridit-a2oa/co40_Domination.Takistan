#include "x_macros.sqf"
private ["_string"];

PARAMS_1(_string);

_capitalize = toArray (toLower _string);
_capitalize set [0, toArray (toUpper toString [_capitalize select 0]) select 0];

toString _capitalize