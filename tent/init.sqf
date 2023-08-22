/**
 * Tent Module
 *
 * Description: This module facilitates more granular control over the interior
 * of OPFOR tents.
 */

#define THIS_MODULE tent
#include "x_macros.sqf"

// Tent object to consider as the parent
GVAR(tent_type_object) = "Land_tent_east";

// Groups of objects to populate tents with
GVAR(tent_type_groups) = [
    [
        ["FoldChair", [-2.8, -2.2, 0], -110],
        ["FoldChair", [-2.4, -1.2, 0], -90],
        ["FoldChair", [-0.8, -1.2, 0], 100],
        ["FoldChair", [2.4, -2.2, 0], 100],
        ["FoldChair", [2.5, -1.2, 0], 90],
        ["FoldChair", [2, 2.5, 0], 5],
        ["FoldChair", [1, 2.6, 0], 0],
        ["FoldTable", [-1.8, -1.7, 0], 90],
        ["FoldTable", [1.8, -1.7, 0], 90],
        ["GunrackTK_EP1", [-1.8, 2.5, 0], -90]
    ],

    [
        ["Fort_Crate_wood", [-3.5, 2.2, 0], 0],
        ["Fort_Crate_wood", [0, 0, 0], -5],
        ["Fort_Crate_wood", [2.2, 2.2, 0], 0],
        ["Fort_Crate_wood", [3.5, 2.2, 0], 5],
        ["Paleta2", [-2, -1.7, 0], -100],
        ["Paleta2", [2.5, -2.6, 0], 0]
    ]
];

__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);

MODULE(THIS_MODULE) = true;