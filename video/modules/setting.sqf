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
        [true, false]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    true
];