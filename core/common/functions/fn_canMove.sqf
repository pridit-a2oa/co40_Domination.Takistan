#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(canMove _vehicle) exitWith {false};

[
    {
        [_vehicle getHit format ["wheel_%1_steering", _x], 1] call BIS_fnc_areEqual
    } count ["1_1", "1_2", "2_1", "2_2"],
    0
] call BIS_fnc_areEqual