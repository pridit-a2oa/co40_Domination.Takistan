#include "x_macros.sqf"
private ["_type", "_cooldown"];

PARAMS_1(_type);

_cooldown = switch (true) do {
    case (_type isKindOf "Helicopter");
    case (_type isKindOf "M2A2_Base"): {
        1500
    };

    case (_type isKindOf "Tank"): {
        1800
    };

    default {
        GVAR(airdrop_time_cooldown)
    };
};

_cooldown