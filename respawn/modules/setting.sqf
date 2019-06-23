/**
 * Respawn Module - Setting Submodule
 */

#define THIS_MODULE respawn
#include "x_macros.sqf"

if (!isNil QMODULE(vehicle_mhq)) then {
    __submodulePP(vehicle_mhq);
};

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Respawn",
        "respawn_type",
        "Set your preferred respawn position. You will respawn at base if selection unavailable",
        [0, player getVariable QGVAR(respawn_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(respawn_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    "base"
];