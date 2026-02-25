#include "x_macros.sqf"
private ["_array"];

_array = +_this;

for "_i" from ((count _array) - 1) to 1 step -1 do {
    private ["_index", "_value"];

    _index = floor random (_i + 1);
    _value = _array select _i;

    {
        _array set _x;
    } forEach [
        [_i, _array select _index],
        [_index, _value]
    ]
};

_array