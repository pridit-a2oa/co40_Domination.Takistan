#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

[[
    _vehicle getHit "wheel_1_1_steering",
    _vehicle getHit "wheel_1_2_steering",
    _vehicle getHit "wheel_2_1_steering",
    _vehicle getHit "wheel_2_2_steering"
] find 1, -1] call BIS_fnc_areEqual