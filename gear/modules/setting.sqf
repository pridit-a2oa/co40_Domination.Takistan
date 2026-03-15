/**
 * Gear Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Gear",
        "gear",
        "Set whether currently equipped gear persists between sessions (excl. backpack &amp; BAF medics)",
        ["Equipped", "Default"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];