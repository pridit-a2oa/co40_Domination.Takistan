#include "x_macros.sqf"
private ["_vehicle", "_attachment"];

PARAMS_1(_vehicle);

_attachment = switch (true) do {
    case (_vehicle isKindOf "ATV_Base_EP1"): {
        [0, -0.5, -0.9]
    };

    case (_vehicle isKindOf "BAF_Jackal2_BASE_D"): {
        [0, 2, -2.9]
    };

    case (_vehicle isKindOf "BMP2_HQ_Base"): {
        [0, 2, 1.15];
    };

    case (_vehicle isKindOf "HMMWV_Base"): {
        [0, 2, -2.1]
    };

    case (_vehicle isKindOf "MLRS");
    case (_vehicle isKindOf "StrykerBase_EP1");
    case (_vehicle isKindOf "Truck"): {
        [0, 2, -2.57]
    };

    case (_vehicle isKindOf "Motorcycle"): {
        [0.15, -0.5, -0.8]
    };

    case (_vehicle isKindOf "Tank"): {
        [0, 2, -2.4]
    };

    case (_vehicle isKindOf "Wheeled_APC"): {
        [0, 2.2, -2.8]
    };

    default {
        [0, 1, -2.7]
    };
};

_attachment