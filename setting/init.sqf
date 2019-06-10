/**
 * Setting Module
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

// Set valid setting types
GVAR(setting_type_valid) = [
    [
        "Earplugs",
        "earplugs",
        "Set to substantially reduce the volume of in-game sound effects",
        ["Yes", "No"],
        [0.1, 1]
    ],
    [
        "Grass",
        "grass",
        "Set grass density",
        ["None", "Medium", "High"],
        [50, 25, 12.5]
    ],
    [
        "View Distance",
        "view_distance",
        "Set the distance which terrain and objects will be visible (high performance impact)",
        [500, 10000]
    ]
];

// Set default values corresponding with valid types
GVAR(setting_type_default) = [
    1,
    50,
    3000
];

__cppfln(FUNC(THIS_MODULE,hide),THIS_MODULE\functions\fn_hide.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;