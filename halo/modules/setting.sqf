/**
 * HALO Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Parachute",
        "parachute",
        "Set whether chute opens automatically during a HALO jump (close to the ground)",
        ["Yes", "No"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];