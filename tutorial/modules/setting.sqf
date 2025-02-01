/**
 * Tutorial Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Tutorial",
        "tutorial",
        "Set whether the introduction slideshow will play next time you load into the mission",
        ["Replay", "Skip"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];