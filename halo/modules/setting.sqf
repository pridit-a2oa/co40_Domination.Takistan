/**
 * HALO Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Parachute",
        "parachute",
        "Set parachute deployment behaviour during a HALO jump",
        ["Automatic", "Manual"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];