#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

_type = configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> _type;

_type