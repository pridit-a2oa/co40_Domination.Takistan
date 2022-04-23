#define THIS_MODULE vehicle_ramp
#include "x_macros.sqf"
private ["_vehicle", "_phase"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {false};

_phase = _vehicle animationPhase "ramp_top";

_vehicle animate ["ramp_top", 1 - _phase];
_vehicle animate ["ramp_bottom", 1 - _phase];

true