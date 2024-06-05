#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if !(alive _target) exitWith {false};
if !([] call FUNC(common,ready)) exitWith {false};
if !(_target getVariable QGVAR(unconscious)) exitWith {false};
if (!isNil QMODULE(drag) && {_target getVariable QGVAR(dragging)}) exitWith {false};

true