#include "x_macros.sqf"
private ["_request", "_type"];

PARAMS_1(_request);

_type = switch (true) do {
    case ([_request, "airdrop"] call KRON_StrInStr): {"RequestingSupplyDropAtGrid"};
    case ([_request, "artillery"] call KRON_StrInStr): {"RequestingFireSupportAtGrid"};
    default {"RequestingSupportTo"};
};

_type