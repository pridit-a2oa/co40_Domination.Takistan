#include "x_macros.sqf"
private ["_array", "_string"];

PARAMS_1(_array);

_string = "";

{
    if (count (toArray _x) > 0) then {
        _string = _string + (if ([_forEachIndex, (count _array) - 1] call BIS_fnc_areEqual) then {_x} else {format ["%1<br />", _x]});
    };
} forEach _array;

_string