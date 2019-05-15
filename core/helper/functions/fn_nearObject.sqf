#include "x_macros.sqf"
private ["_name", "_position", "_type", "_distance", "_object", "_condition"];

PARAMS_4(_name, _position, _type, _distance);

_object = getPos ((nearestObjects [_position, [_type], _distance select 0]) select 0);

_condition = if (_distance select 1 == "within") then {
    (isNil "_object")
} else {
    (!isNil "_object")
};

if (_condition) exitWith {
    format [
        "%1 can only be %2 %4 %3m %5",
        _name select 0,
        _name select 1,
        _distance select 0,
        _distance select 1,
        _distance select 2
    ];
};

true