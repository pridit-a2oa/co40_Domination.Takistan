#include "x_macros.sqf"
private ["_type", "_side"];

PARAMS_1(_type);

_side = switch (_type select 0) do {
    case "BIS_TK";
    case "BIS_TK_INS": {"East"},
    case "BIS_US": {"West"}
};

configFile >> "CfgGroups" >> _side >> (_type select 0) >> "Infantry" >> (_type select 1)