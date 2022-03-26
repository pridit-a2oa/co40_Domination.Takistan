#include "x_macros.sqf"
private ["_vehicle"];

if (GVAR(rebuilding)) exitWith {false};

_vehicle = (nearestObjects [position GVAR(service_wreck), GVAR(vehicle_wreck_types), 10]) select 0;

if (isNil "_vehicle") exitWith {false};
if (isNil {_vehicle getVariable QGVAR(wreckable)}) exitWith {false};
if (!isNil {GVAR(wreck)}) exitWith {false};

if (alive _vehicle) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if (((position _vehicle) select 2) > 5) exitWith {false};
if !(_vehicle getVariable QGVAR(wreckable)) exitWith {false};
if (GVAR(wreck_hangars_occupied) == count (X_JIPH getVariable QGVAR(wreck_hangars))) exitWith {false};

GVAR(wreck) = _vehicle;

true