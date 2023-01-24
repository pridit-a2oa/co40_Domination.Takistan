#include "x_macros.sqf"
private ["_object", "_offset"];

PARAMS_1(_object);

_offset = switch (_object) do {
    case "Fort_Crate_wood": {[0, 0, 0.48]};
};

_offset