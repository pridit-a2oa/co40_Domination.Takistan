/**
 * Unit Module
 *
 * Descrption: This module is responsible for handling the spawning of units.
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

__cppfln(FUNC(THIS_MODULE,patrol),THIS_MODULE\functions\fn_patrol.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;
