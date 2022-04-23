#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(alive _vehicle) exitWith {false};
if (locked _vehicle) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if !((_vehicle animationPhase "ramp_top") in [0, 1]) exitWith {false};

true