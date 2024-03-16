#include "x_macros.sqf"
private ["_type", "_module"];

PARAMS_2(_type, _module);

_strings = call compile format ["d_language_%1", _module];

systemChat format ["%1 | %2 | %3", _module, _type, _strings];

// _string = [_strings, _type] call BIS_fnc_findNestedElement;

// if ([_string, ""] call BIS_fnc_areEqual) then {_strings select 1}