#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(alive _vehicle) exitWith {false};
if (locked _vehicle) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if (speed _vehicle > 5 && {(position _vehicle) select 2 < 100}) exitWith {false};
if (!isNil QMODULE(vehicle_deploy) && {!isNil {_vehicle getVariable QGVAR(deployed)} && {(_vehicle getVariable QGVAR(deployed)) select 0}}) exitWith {false};

true