
/**
 * Vehicle Upgrade Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Vehicle: Upgrade",
        "vehicle_upgrade_type",
        "Set type of Stryker upgrade (conversion) to perform via the vehicle menu",
        [0, player getVariable QGVAR(vehicle_upgrade_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(vehicle_upgrade_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    ((player getVariable QGVAR(vehicle_upgrade_types)) select 0) select 1
];