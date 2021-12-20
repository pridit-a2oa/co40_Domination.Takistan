/**
 * 3D Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "3D Text",
        "3d",
        "Set whether 3D text is visible. Does not impact camp capture countdown",
        ["Show", "Hide"],
        [1, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    1
];