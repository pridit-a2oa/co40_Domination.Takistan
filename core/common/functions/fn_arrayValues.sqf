#include "x_macros.sqf"
private ["_index", "_haystack"];

PARAMS_2(_index, _haystack);

_values = [];

{
    _values = _values + [_x select _index];
} forEach _haystack;

_values