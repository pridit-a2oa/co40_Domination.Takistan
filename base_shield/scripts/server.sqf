#include "x_macros.sqf"

_trigger = createTrigger ["EmptyDetector", position GVAR(FLAG_BASE)];
_trigger setTriggerArea [25, 25, 0, false];
_trigger setTriggerActivation ["EAST", "PRESENT", true];
_trigger setTriggerStatements ["this", "thislist call {{_x setDamage 1} forEach _this}", ""];