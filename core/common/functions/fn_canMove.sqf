#include "x_macros.sqf"
private ["_vehicle", "_wheels"];

PARAMS_1(_vehicle);

_wheels = [
    _vehicle getHit "wheel_1_1_steering",
    _vehicle getHit "wheel_1_2_steering",
    _vehicle getHit "wheel_2_1_steering",
    _vehicle getHit "wheel_2_2_steering"
];

(_wheels find 1 == -1)