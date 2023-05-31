#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName")