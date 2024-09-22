/**
 * Vehicle Loadout Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Vehicle: Loadout",
        "vehicle_loadout",
        "Set whether you see an output of the new armament &amp; capacity on loadout switch",
        ["Show", "Hide"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    10
];