#include "x_macros.sqf"
private ["_name", "_position"];

PARAMS_2(_name, _position);

if !([count nearestObjects [_position, ["AllVehicles", "CAManBase"], 8], 0] call BIS_fnc_areEqual) exitWith {
    format [
        "%1 cannot be %2 in occupied space",
        _name select 0,
        _name select 1
    ];
};

true