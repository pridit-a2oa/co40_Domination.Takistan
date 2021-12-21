/**
 * Video Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "GPS Video",
        "video",
        "Set whether media content can play within the GPS",
        ["Yes", "No"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];