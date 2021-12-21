#include "x_macros.sqf"
private ["_setting", "_type"];

PARAMS_1(_setting);

_type = switch (_setting) do {
    case "earplugs": {["1 fadeSound", "soundVolume"]};
    case "grass": {["setTerrainGrid", "(player getVariable 'd_grass') / 10"]};
    case "view_distance": {["setViewDistance", "viewDistance"]};
    default {""};
};

_type