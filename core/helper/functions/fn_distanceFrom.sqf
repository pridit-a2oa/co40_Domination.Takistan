#include "x_macros.sqf"
private ["_name", "_origin", "_position", "_distance", "_condition"];

PARAMS_4(_name, _origin, _position, _distance);

_condition = if ([_distance select 1, "within"] call BIS_fnc_areEqual) then {
    (_origin distance _position > (_distance select 0))
} else {
    (_origin distance _position < (_distance select 0))
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