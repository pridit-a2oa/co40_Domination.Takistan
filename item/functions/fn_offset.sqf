#include "x_macros.sqf"
private ["_object", "_offset"];

PARAMS_1(_object);

_offset = switch (_object) do {
    case "FoldTable": {[[-0.5, -0.22, 0.22, 0.5] call BIS_fnc_selectRandom, 0, 0.4]};
    case "Fort_Crate_wood": {[0, 0, 0.47]};
};

_offset