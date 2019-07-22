#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_trigger"];

PARAMS_2(_target, _trigger);

_target setVariable [QGVAR(detected), true];

if (_target getVariable QGVAR(radios) == 0) exitWith {
    deleteVehicle _trigger;
};

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Detected", ["1", {}, _target getVariable "name", []], true];

[_target] __fsm(reinforce);