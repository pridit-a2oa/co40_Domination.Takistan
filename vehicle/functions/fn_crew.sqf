#include "x_macros.sqf"
private ["_unit", "_crew"];

PARAMS_1(_unit);

if ([count crew _unit, 0] call BIS_fnc_areEqual) exitWith {"NONE"};

_crew = "";

{
    if ([_forEachIndex + 1, count crew _unit] call BIS_fnc_areEqual) then {
        _crew = format ["%1%2", _crew, name _x];
    } else {
        _crew = format ["%1%2,", _crew, name _x];
    };
} forEach crew _unit;

_crew