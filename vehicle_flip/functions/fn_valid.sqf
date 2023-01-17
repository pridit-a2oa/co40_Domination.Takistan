#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(player getVariable QGVAR(flip)) exitWith {false};
if (player in _vehicle) exitWith {false};
if (player distance _vehicle > 10) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if !((vectorUp _vehicle) select 2 < 0.6) exitWith {false};

true