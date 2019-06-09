/**
 * Setting Module
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

// Set valid setting types
GVAR(setting_type_valid) = [
    [
        "Grass",
        "grass",
        ["None", "Medium", "High"],
        [50, 25, 12.5]
    ],
    [
        "Vehicle Welcome",
        "vehicle_welcome",
        ["On", "Off"],
        [1, 0]
    ],
    [
        "View Distance",
        "view_distance",
        [500, 10000]
    ]
];

// Set default values corresponding with valid types
GVAR(setting_type_default) = [
    50,
    1,
    3000
];

// Set maximum amount of options that can exist
GVAR(setting_amount_options) = 6;

__cppfln(FUNC(THIS_MODULE,change),THIS_MODULE\functions\fn_change.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;