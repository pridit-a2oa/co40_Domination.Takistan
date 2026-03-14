/**
 * Gear Module
 *
 * Description: This module facilitates the governance and persistence of gear.
 */

#define THIS_MODULE gear
#include "x_macros.sqf"

// Types of magazines to exclude from persistence
GVAR(gear_exclude_magazines) = [
    "Igla",
    "OG7",
    "PG7V",
    "PG7VL",
    "PG7VR",
    "RPG18",
    "Strela"
];

// Types of weapons to exclude from persistence
GVAR(gear_exclude_weapons) = [
    "Igla",
    "M32_EP1",
    "RPG7V",
    "RPG18",
    "Strela"
];

__cppfln(FUNC(THIS_MODULE,default),THIS_MODULE\functions\fn_default.sqf);
__cppfln(FUNC(THIS_MODULE,items),THIS_MODULE\functions\fn_items.sqf);
__cppfln(FUNC(THIS_MODULE,key),THIS_MODULE\functions\fn_key.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);

MODULE(THIS_MODULE) = true;