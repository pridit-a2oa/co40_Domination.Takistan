#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (_vehicle) do {
    case "HMMWV_DES_EP1": {
        [0, -13, 0]
    };

    case "MH6J_EP1": {
        [-18, 16, 0]
    };

    case "ATV_US_EP1";
    case "M1030_US_DES_EP1";
    case "TT650_TK_EP1": {
        [-6, 0, 0]
    };
};

_offset