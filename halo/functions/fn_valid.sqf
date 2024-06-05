#include "x_macros.sqf"
private ["_vehicle"];

_vehicle = vehicle player;

if !(_vehicle isKindOf "Air") exitWith {false};
if ([player, driver _vehicle] call BIS_fnc_areEqual) exitWith {false};
if ((getPos _vehicle) select 2 < GVAR(halo_distance_minimum)) exitWith {false};
if (!([_vehicle animationPhase "ramp_bottom", 1] call BIS_fnc_areEqual) && {!(player getVariable QGVAR(halo))}) exitWith {false};

true