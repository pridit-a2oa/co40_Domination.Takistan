/**
 * Reward Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Rewards",
        "reward",
        "Set whether an overlay will display whenever you have earned rewards",
        ["Show", "Hide"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];