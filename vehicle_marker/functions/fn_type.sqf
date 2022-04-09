#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

_type = switch (true) do {
    case (_vehicle isKindOf "APC" || {_vehicle isKindOf "Tracked_APC"} || {_vehicle isKindOf "Wheeled_APC"}): {"_mech_inf"};
    case (_vehicle isKindOf "Tank"): {"_armor"};
    case (_vehicle isKindOf "Helicopter"): {"_air"};
    case (_vehicle isKindOf "UAV"): {"_recon"};
    case (_vehicle isKindOf "Plane"): {"_plane"};
    case ([typeOf _vehicle, "Repair"] call KRON_StrInStr): {"_maint"};
    case ([typeOf _vehicle, "Ambulance"] call KRON_StrInStr): {"_med"};
    default {"_empty"};
};

_type = switch (true) do {
    case ((faction _vehicle) in ["USMC", "BIS_US", "BIS_BAF"]): {format ["b%1", _type]};
    case ((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"]): {format ["o%1", _type]};
    default {format ["n%1", _type]};
};

_type