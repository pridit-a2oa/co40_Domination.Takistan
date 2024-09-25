#include "x_macros.sqf"
private ["_name", "_position", "_safe"];

PARAMS_2(_name, _position);

_safe = [_position, 0, 1, 5, 0, 0, 0] call BIS_fnc_findSafePos;

if ([_safe, [8000,1900,300]] call BIS_fnc_areEqual) exitWith {
    format [
        "%1 cannot be %2 due to an obstruction with terrain/object",
        _name select 0,
        _name select 1
    ];
};

true