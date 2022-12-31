#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_trigger"];

PARAMS_2(_target, _trigger);

_target setVariable [QGVAR(detected), true];

if ({alive _x} count (_target getVariable QGVAR(radios)) == 0) exitWith {
    deleteVehicle _trigger;
};

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Detected"],
        [
            ["1", {}, _target getVariable "name", []]
        ]
    ] call FUNC(conversation,radio);
};

[_target] __fsm(reinforce);