/**
 * Unit Module
 *
 * Descrption: This module is responsible for handling the behaviour pattern of
 * AI units.
 */

#define THIS_MODULE unit
#include "x_macros.sqf"

// Set infantry types
GVAR(unit_type_infantry) = [
    "TK_InfantrySquad",
    "TK_InfantrySection",
    "TK_InfantrySectionAT",
    "TK_InfantrySectionAA",
    "TK_InfantrySectionMG",
    "TK_SniperTeam",
    "TK_SpecialPurposeSquad"
];

// Set light vehicle types
GVAR(unit_type_vehicle_light) = [
    "BTR40_MG_TK_INS_EP1",
    "LandRover_MG_TK_EP1",
    "LandRover_MG_TK_INS_EP1",
    "LandRover_SPG9_TK_EP1",
    "LandRover_SPG9_TK_INS_EP1",
    "UAZ_AGS30_TK_EP1",
    "UAZ_MG_TK_EP1"
];

// Set heavy (armor) vehicle types
GVAR(unit_type_vehicle_armor) = [
    "BMP2_HQ_TK_EP1",
    "BMP2_TK_EP1",
    "BRDM2_ATGM_TK_EP1",
    "BRDM2_TK_EP1",
    "BTR60_TK_EP1",
    "M113_TK_EP1",
    "T34_TK_EP1",
    "T55_TK_EP1",
    "T72_TK_EP1",
    "Ural_ZU23_TK_EP1"
];

__cppfln(FUNC(THIS_MODULE,defend),THIS_MODULE\functions\fn_defend.sqf);
__cppfln(FUNC(THIS_MODULE,patrol),THIS_MODULE\functions\fn_patrol.sqf);
__cppfln(FUNC(THIS_MODULE,road),THIS_MODULE\functions\fn_road.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;