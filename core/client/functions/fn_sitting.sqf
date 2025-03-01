#include "x_macros.sqf"

switch (true) do {
    case ([animationState player, "_ground"] call KRON_StrInStr);
    case ([animationState player, "amovpsit"] call KRON_StrInStr): {
        true
    };

    default {
        false
    };
};