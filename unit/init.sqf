/**
 * Unit Module
 *
 * Descrption: This module is responsible for handling the behaviour pattern of
 * AI units.
 */

#define THIS_MODULE unit
#include "x_macros.sqf"

// Set infantry types (groups).
GVAR(unit_type_infantry) = [
    "TK_InfantrySquad",
    "TK_InfantrySection",
    "TK_InfantrySectionAT",
    "TK_InfantrySectionAA",
    "TK_InfantrySectionMG",
    "TK_SniperTeam",
    "TK_SpecialPurposeSquad"
];

// Set light vehicle types.
GVAR(unit_type_vehicles_light) = [
    "BTR40_TK_INS_EP1",
    "BTR40_MG_TK_INS_EP1",
    "LandRover_MG_TK_EP1",
    "LandRover_MG_TK_INS_EP1",
    "LandRover_SPG9_TK_EP1",
    "LandRover_SPG9_TK_INS_EP1",
    "UAZ_AGS30_TK_EP1",
    "UAZ_MG_TK_EP1"
];

// Set heavy (armor) vehicle types along with whether they should be unique.
GVAR(unit_type_vehicles_heavy) = [
    ["BMP2_HQ_TK_EP1",      true],
    ["BMP2_TK_EP1",         false],
    ["BRDM2_ATGM_TK_EP1",   false],
    ["BRDM2_TK_EP1",        false],
    ["BTR60_TK_EP1",        false],
    ["M113_TK_EP1",         false],
    ["T34_TK_EP1",          false],
    ["T55_TK_EP1",          false],
    ["T72_TK_EP1",          false],
    ["Ural_ZU23_TK_EP1",    true]
];

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,defend),THIS_MODULE\functions\fn_defend.sqf);
__cppfln(FUNC(THIS_MODULE,patrol),THIS_MODULE\functions\fn_patrol.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;