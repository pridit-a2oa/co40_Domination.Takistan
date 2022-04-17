#include "x_macros.sqf"
private ["_index", "_haystack", "_stack", "_values", "_value"];

PARAMS_3(_index, _haystack, _stack);

if (isNil "_stack") then {
    _stack = false;
};

_values = [];

{
    _value = _x select _index;

    if !(isNil "_value") then {
        if !(typeName _value in ["STRING", "ARRAY", "SCALAR", "LOCATION", "BOOL"]) then {
            _value = str _value;
        };

        if (!_stack) then {
            _values = _values + [_value];
        } else {
            _values = _values + _value;
        };
    };
} forEach _haystack;

_values