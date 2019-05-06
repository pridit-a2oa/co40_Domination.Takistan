#include "x_macros.sqf"
private ["_vehicle", "_attachment"];

PARAMS_1(_vehicle);

_attachment = switch (true) do {
    case (_vehicle isKindOf "Wheeled_APC"): {[0, 2.2, -1.8]};
    case (_vehicle isKindOf "Tank"):        {[0, 2, -2]};
    default                                 {[0, 1, -2.7]};
};

_attachment