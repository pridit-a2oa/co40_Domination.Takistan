/**
 * 3D Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "3D Text",
        "3d",
        "Set whether 3D text is visible (camp capture countdown is always visible)",
        ["Show", "Hide"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];