#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (_target getVariable QGVAR(spotted)) exitWith {};
if (_target getVariable QGVAR(antennas) < 1) exitWith {};

_target setVariable [QGVAR(spotted), true];

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Detected", ["1", {}, _target getVariable "name", []], true];

[_target] __fsm(reinforce);