#include "x_macros.sqf"
private ["_time"];

PARAMS_1(_time);

if (!isNil "_time") then {
    GVAR(rebuild) = _time + call FUNC(common,time);
};

_time = GVAR(rebuild);

if (_time < 1) exitWith {0};

_time - call FUNC(common,time);