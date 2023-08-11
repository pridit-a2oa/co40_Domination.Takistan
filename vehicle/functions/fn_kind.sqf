#include "x_macros.sqf"
private ["_vehicle", "_kind"];

PARAMS_1(_vehicle);

_kind = (switch (true) do {
    case (_vehicle isKindOf "LandVehicle"): {
        "Land Vehicle"
    };

    case (_vehicle isKindOf "Helicopter"): {
        "Chopper"
    };

    case (_vehicle isKindOf "Plane"): {
        "Jet"
    };
});

_kind