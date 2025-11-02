#include "x_macros.sqf"
private ["_name", "_position", "_type", "_distance", "_object", "_condition"];

PARAMS_4(_name, _position, _type, _distance);

_object = getPos ((nearestObjects [_position, [_type], _distance select 0]) select 0);

if !(isNil "_object") exitWith {
    format [
        "%1 can only be %2 %3m %4",
        _name select 0,
        _name select 1,
        _distance select 0,
        _distance select 1
    ];
};

true