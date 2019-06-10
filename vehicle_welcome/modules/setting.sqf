/**
 * Vehicle Welcome Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Vehicle Welcome",
        "vehicle_welcome",
        "Set whether the functional capabilities of helicopters are shown when entering as pilot",
        ["Show", "Hide"],
        [true, false]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    true
];