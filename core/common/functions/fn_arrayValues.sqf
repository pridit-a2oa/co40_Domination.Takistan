#include "x_macros.sqf"
private ["_index", "_haystack"];

PARAMS_2(_index, _haystack);

_values = [];

{
    _value = _x select _index;
    
    if (typeName _value != "STRING") then {
        _value = str _value;
    };
    
    _values = _values + [_value];
} forEach _haystack;

_values