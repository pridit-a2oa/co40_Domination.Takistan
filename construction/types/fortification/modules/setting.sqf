/**
 * Construction (Fortification) Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Fortification",
        "fortification_type",
        "Set type of fortification object that will be constructed",
        [0, player getVariable QGVAR(fortification_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(fortification_types)] call FUNC(common,arrayValues),
        true
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    ((player getVariable QGVAR(fortification_types)) select 0) select 1
];