#include "x_macros.sqf"
private ["_name", "_source", "_position", "_distance", "_condition"];

PARAMS_4(_name, _source, _position, _distance);

_condition = if (_distance select 1 == "within") then {
    (_source distance _position > (_distance select 0))
} else {
    (_source distance _position < (_distance select 0))
};

if (_condition) exitWith {
    hint format [
        "%1 must be called %3 %2m %4",
        _name,
        _distance select 0,
        _distance select 1,
        _distance select 2
    ];
    
    false
};

true