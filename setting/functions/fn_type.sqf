#include "x_macros.sqf"
private ["_setting", "_type"];

PARAMS_1(_setting);

_type = switch (_setting) do {
    case "grass": {["setTerrainGrid", "missionNamespace getVariable 'd_grass'"]};
    case "view_distance": {["setViewDistance", "viewDistance"]};
    default {""};
};

_type