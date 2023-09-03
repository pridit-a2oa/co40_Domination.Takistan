/**
 * Vehicle Lift - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Overlay: Lift",
        "lift",
        "Set whether a guidance overlay will appear when close to a liftable vehicle",
        ["Show", "Hide"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];