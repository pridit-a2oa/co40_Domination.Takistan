#include "x_macros.sqf"
private ["_object", "_time"];

PARAMS_2(_object, _time);

if (!isNil "_time") then {
    _object setVariable [QGVAR(time), _time + call FUNC(common,time)];
};

_time = _object getVariable QGVAR(time);

if (_time < 1) exitWith {0};

_time - call FUNC(common,time);