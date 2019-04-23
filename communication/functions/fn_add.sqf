#include "x_macros.sqf"
private ["_type", "_name", "_usable", "_execute", "_order"];
PARAMS_5(_type, _name, _usable, _execute, _order);

waitUntil {!(isNil "BIS_MENU_GroupCommunication")};

[_type, [
    _name,
    [if (!isNil "_order") then {_order} else {(count _type) + 1}],
    "",
    -5,
    [["expression", _execute]],
    "1",
    _usable
]] call BIS_fnc_arrayPush;