/**
 * 3D Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "3D Text",
        "3d",
        "Set whether 3D text (in certain areas to highlight their function) is visible",
        ["Show", "Hide"],
        [true, false]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    true
];