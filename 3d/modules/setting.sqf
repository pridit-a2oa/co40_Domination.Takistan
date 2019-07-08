/**
 * 3D Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "3D Text",
        "3d",
        "Set whether 3D text is visible. This setting will not impact the camp capture countdown",
        ["Show", "Hide"],
        [true, false]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    true
];