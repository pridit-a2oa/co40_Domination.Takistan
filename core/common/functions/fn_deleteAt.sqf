#include "x_macros.sqf"
private ["_array", "_index", "_output"];

PARAMS_2(_array, _index);

_output = [];

{
    if !([_index, _forEachIndex] call BIS_fnc_areEqual) then {
        _output = _output + [_x];
    };
} forEach _array;

_output