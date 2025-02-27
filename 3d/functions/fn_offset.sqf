#include "x_macros.sqf"
private ["_entity", "_offset"];

PARAMS_1(_entity);

_offset = switch (_entity) do {
    case "BAF_Merlin_HC3_D";
    case "MV22": {
        [0, 2, -2]
    };

    case "C130J_US_EP1": {
        [0, 5, -2]
    };

    case "HeliH";
    case "HeliHEmpty";
    case "HeliHRescue": {
        [0, 0, 1]
    };

    case "MQ9PredatorB_US_EP1": {
        [0, -3, -2]
    };

    default {
        [0, 0, -2]
    };
};

_offset