/**
 * Language Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Language",
        "language",
        "Set language for text. Translations are community sourced. Requires reconnect.",
        [0, GVAR(language_types)] call FUNC(common,arrayValues),
        [1, GVAR(language_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    "EN"
];