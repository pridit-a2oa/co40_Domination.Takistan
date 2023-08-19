#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(alive _vehicle) exitWith {false};
if !(alive (driver _vehicle)) exitWith {false};
if !(canMove _vehicle) exitWith {false};
if !([_vehicle] call FUNC(common,canMove)) exitWith {false};

true