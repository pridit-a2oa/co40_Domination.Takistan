#include "x_macros.sqf"
private ["_position"];

PARAMS_1(_position);

[[
    GVAR(investigation_encampment_type),
    [
        ["FoldChair"],
        ["SmallTable"]
    ]
], _position, 45] call FUNC(investigation,composition);