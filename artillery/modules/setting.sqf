/**
 * Artillery Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Artillery",
        "artillery_type",
        "Set artillery ordnance (cooldown time is unaffected by changes)",
        [0, player getVariable QGVAR(artillery_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(artillery_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    (GVAR(artillery_type_ordnance) select 0) select 1
];