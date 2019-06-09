#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Detected", ["1", {}, _target getVariable "name", []], true];