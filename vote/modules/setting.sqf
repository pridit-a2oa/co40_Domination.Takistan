/**
 * Vote Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Overlay: Votes",
        "vote",
        "Set whether an overlay will appear for vote states (pass is always visible)",
        ["Show", "Hide"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];