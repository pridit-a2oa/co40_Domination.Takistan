#include "x_macros.sqf"
private ["_target"];

_target = _this select 3;

_target setVariable [QGVAR(dragging), false, true];

[_target, "playActionNow", "Die"] call FUNC(network,mp);