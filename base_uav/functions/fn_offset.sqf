#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (_vehicle) do {
    case "MQ9PredatorB_US_EP1":    {[0, 3, 0]};
    default                        {[0, 0, 0]};
};

_offset