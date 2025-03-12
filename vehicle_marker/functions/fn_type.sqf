#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

format [
    "%1_%2",
    switch (true) do {
        case (faction _vehicle in ["BIS_BAF", "BIS_US", "USMC"]): {
            "b"
        };

        case (faction _vehicle in ["BIS_TK", "BIS_TK_INS"]): {
            "o"
        };

        default {
            "n"
        };
    },
    switch (true) do {
        case (_vehicle isKindOf "APC");
        case (_vehicle isKindOf "BAF_Jackal2_BASE_D");
        case (_vehicle isKindOf "HMMWV_M1151_M2_DES_EP1");
        case (_vehicle isKindOf "Tracked_APC");
        case (_vehicle isKindOf "Wheeled_APC"): {
            "mech_inf"
        };

        case (_vehicle isKindOf "Tank"): {
            "armor"
        };

        case (_vehicle isKindOf "Helicopter"): {
            "air"
        };

        case (_vehicle isKindOf "UAV"): {
            "recon"
        };

        case (_vehicle isKindOf "Plane"): {
            "plane"
        };

        case ([typeOf _vehicle, "Repair"] call KRON_StrInStr): {
            "maint"
        };

        case ([typeOf _vehicle, "Ambulance"] call KRON_StrInStr): {
            "med"
        };

        default {
            "empty"
        };
    }
]