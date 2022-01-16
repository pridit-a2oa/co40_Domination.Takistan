#include "x_macros.sqf"
private ["_array"];

PARAMS_1(_array);

_string = "";

{
	_string = _string + (if (_forEachIndex == (count _array - 1)) then {_x} else {format ["%1<br />", _x]});
} forEach _array;

_string