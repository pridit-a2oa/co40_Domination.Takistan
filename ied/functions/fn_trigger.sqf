#include "x_macros.sqf"
private ["_ied", "_distance", "_trigger"];

PARAMS_1(_ied);

_distance = GVAR(ied_trigger_distances) select 1;

_trigger = createTrigger ["EmptyDetector", getPos _ied];
_trigger setTriggerArea [_distance, _distance, 0, true];
_trigger setTriggerActivation ["WEST", "PRESENT", false];
_trigger setTriggerStatements [
    "this && call d_fnc_ied_valid",
    "[[thisList select 0] call d_fnc_ied_near] call d_fnc_ied_detonate",
    ""
];