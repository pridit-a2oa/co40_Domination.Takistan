#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (_vehicle) do {
    case "C130J_US_EP1":        {[0, -9, 0]};
    default                     {[0, -6, 0]};
};

_offset