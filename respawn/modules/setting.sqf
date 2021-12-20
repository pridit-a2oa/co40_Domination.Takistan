/**
 * Respawn Module - Setting Submodule
 */

#define THIS_MODULE respawn
#include "x_macros.sqf"

if (!isNil QMODULE(mash)) then {
    __submodulePP(mash);
};

if (!isNil QMODULE(vehicle_mhq)) then {
    __submodulePP(vehicle_mhq);
};

if (!isNil QMODULE(vehicle_fob)) then {
    __submodulePP(vehicle_fob);
};

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Respawn",
        "respawn_type",
        "Set your preferred respawn position. Defaults to base if you die outside distance",
        [0, player getVariable QGVAR(respawn_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(respawn_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    "base"
];