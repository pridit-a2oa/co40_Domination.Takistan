/**
 * Backpack Module
 *
 * Description: This module spawns a backpack heap with subsequent context
 * options for players to equip a backpack.
 */

#define THIS_MODULE base_backpack
#include "x_macros.sqf"

// Set list of backpacks
GVAR(base_backpack_types) = [
    "TK_ALICE_Pack_EP1",
    "US_Assault_Pack_EP1",
    "TK_Assault_Pack_EP1",
    "US_Backpack_EP1",
    "BAF_AssaultPack_special",
    "CZ_Backpack_EP1",
    "CZ_VestPouch_EP1",
    "DE_Backpack_Specops_EP1",
    "M2StaticMG_US_Bag_EP1",
    "M2HD_mini_TriPod_US_Bag_EP1",
    "M252_US_Bag_EP1",
    "US_Patrol_Pack_EP1",
    "TK_RPG_Backpack_EP1",
    "TOW_TriPod_US_Bag_EP1",
    "Tripod_Bag"
];

__cppfln(FUNC(THIS_MODULE,list),THIS_MODULE\functions\fn_list.sqf);
__cppfln(FUNC(THIS_MODULE,take),THIS_MODULE\functions\fn_take.sqf);

MODULE(THIS_MODULE) = true;