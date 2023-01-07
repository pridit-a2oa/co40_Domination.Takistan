/**
 * Unit Module
 *
 * Descrption: This module is responsible for handling the behaviour pattern
 * and creation of AI units.
 */

#define THIS_MODULE unit
#include "x_macros.sqf"

// Infantry types (groups)
GVAR(unit_type_infantry) = [
    ["BIS_TK",      "TK_InfantrySquad"],
    ["BIS_TK",      "TK_InfantrySection"],
    ["BIS_TK",      "TK_InfantrySectionAT"],
    ["BIS_TK",      "TK_InfantrySectionAA"],
    ["BIS_TK",      "TK_InfantrySectionMG"],
    ["BIS_TK",      "TK_SniperTeam"],
    ["BIS_TK",      "TK_SpecialPurposeSquad"],
    ["BIS_TK_INS",  "TK_INS_Group"],
    ["BIS_TK_INS",  "TK_INS_Patrol"],
    ["BIS_TK_INS",  "TK_INS_AATeam"],
    ["BIS_TK_INS",  "TK_INS_ATTeam"]
];

// Light vehicle types
GVAR(unit_type_vehicles_light) = [
    "LandRover_MG_TK_EP1",
    "LandRover_MG_TK_INS_EP1",
    "LandRover_SPG9_TK_EP1",
    "LandRover_SPG9_TK_INS_EP1",
    "UAZ_AGS30_TK_EP1",
    "UAZ_MG_TK_EP1"
];

// APC vehicle types along with uniqueness
GVAR(unit_type_vehicles_apc) = [
    ["BMP2_HQ_TK_EP1",      true],
    ["BMP2_TK_EP1",         false],
    ["BRDM2_ATGM_TK_EP1",   false],
    ["BRDM2_TK_EP1",        false],
    ["BTR60_TK_EP1",        false],
    ["M113_TK_EP1",         false]
];

// Tank vehicle types
GVAR(unit_type_vehicles_tank) = [
    "T55_TK_EP1",
    "T72_TK_EP1"
];

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,defend),THIS_MODULE\functions\fn_defend.sqf);
__cppfln(FUNC(THIS_MODULE,patrol),THIS_MODULE\functions\fn_patrol.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;