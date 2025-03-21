/**
 * Setting Module
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

// Valid setting types
GVAR(setting_type_valid) = [
    [
        "Camera",
        "camera",
        "Set default camera mode (applies on connect &amp; respawn)",
        ["1st Person", "3rd Person"],
        ["INTERNAL", "EXTERNAL"]
    ],
    [
        "Custom Sounds",
        "sounds",
        "Set whether custom (immersion breaking) sounds will play (e.g. MT seized, score rewards)",
        ["Yes", "No"],
        [10, 0]
    ],
    [
        "Earplugs",
        "earplugs",
        "Set to reduce the volume of in-game sound effects",
        ["Yes", "No"],
        [1, 10]
    ],
    [
        "Grass",
        "grass",
        "Set grass density (low performance impact)",
        ["None", "Medium", "High"],
        [500, 250, 125]
    ],
    [
        "Nightvision",
        "nightvision",
        "Set whether nightvision goggles will automatically be toggled at night (if equipped)",
        ["Yes", "No"],
        [10, 0]
    ],
    [
        "View Distance",
        "view_distance",
        "Set rendering distance (high performance impact)",
        [5000, 100000]
    ]
];

// Default values corresponding with valid types
GVAR(setting_type_default) = [
    "EXTERNAL",
    10,
    10,
    500,
    10,
    25000
];

__cppfln(FUNC(THIS_MODULE,hide),THIS_MODULE\functions\fn_hide.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);
__cppfln(FUNC(THIS_MODULE,update),THIS_MODULE\functions\fn_update.sqf);

MODULE(THIS_MODULE) = true;