#include "x_macros.sqf"
private ["_name", "_position", "_any"];

PARAMS_2(_name, _position);

_any = nearestObjects [_position, ["AllVehicles", "CAManBase"], 10];

if (count _any > 0) exitWith {
    format [
        "%1 cannot be %2 in occupied space",
        _name select 0,
        _name select 1
    ];
};

true