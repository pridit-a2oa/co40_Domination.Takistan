#include "x_macros.sqf"
private ["_position"];

PARAMS_1(_position);

[[
    GVAR(investigation_weapons_type),
    [
        ["FoldChair"],
        ["FoldTable"],
        ["Garbage_can"],
        ["Land_A_tent", "TKLaunchers_EP1"],
        ["Land_Fire", "KORD_high_TK_EP1"],
        ["Park_bench1", "Land_fort_bagfence_long"],
        ["SmallTable"],
        ["TKSpecialWeapons_EP1"],
        ["UAZ_AGS30_TK_EP1", "KORD_high_TK_EP1"]
    ]
], _position, 90] call FUNC(investigation,composition);