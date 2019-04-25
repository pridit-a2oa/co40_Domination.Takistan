#include "x_macros.sqf"
private ["_type", "_name", "_usable", "_execute", "_cursor"];
PARAMS_5(_type, _name, _usable, _execute, _cursor);

[_type, [
    _name,
    [(count _type) + 1],
    "",
    -5,
    [["expression", _execute]],
    "1",
    _usable,
    if (!isNil "_cursor") then {_cursor} else {""}
]] call BIS_fnc_arrayPush;