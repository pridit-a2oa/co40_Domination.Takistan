#include "x_macros.sqf"
private ["_type", "_offset"];

PARAMS_1(_type);

_offset = switch (_type) do {
    case "C130J_US_EP1": {-15},
    case "MV22": {-12},
    default {0}
};

_offset