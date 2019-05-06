#include "x_macros.sqf"
private ["_vehicle", "_name"];

PARAMS_1(_vehicle);

_name = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");

_name