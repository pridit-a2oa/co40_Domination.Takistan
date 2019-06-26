#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(detected), true];

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Detected", ["1", {}, _target getVariable "name", []], true];

[_target] __fsm(reinforce);