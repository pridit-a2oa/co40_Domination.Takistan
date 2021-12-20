/**
 * Setting Module
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

// Set valid setting types
GVAR(setting_type_valid) = [
    [
        "Custom Sounds",
        "sounds",
        "Set whether custom sounds will play (MT seized, score rewards)",
        ["Yes", "No"],
        [1, 0]
    ],
    [
        "Earplugs",
        "earplugs",
        "Set to reduce the volume of in-game sound effects",
        ["Yes", "No"],
        [0.1, 1]
    ],
    [
        "Grass",
        "grass",
        "Set grass density",
        ["None", "Medium", "High"],
        [50, 25, 10]
    ],
    [
        "View Distance",
        "view_distance",
        "Set distance for terrain and object visibility (significant performance impact)",
        [500, 10000]
    ]
];

// Set default values corresponding with valid types
GVAR(setting_type_default) = [
    1,
    1,
    50,
    2500
];

__cppfln(FUNC(THIS_MODULE,hide),THIS_MODULE\functions\fn_hide.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,update),THIS_MODULE\functions\fn_update.sqf);

MODULE(THIS_MODULE) = true;