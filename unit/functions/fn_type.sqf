#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

configFile >> "CfgGroups" >> "East" >> (_type select 0) >> "Infantry" >> (_type select 1)