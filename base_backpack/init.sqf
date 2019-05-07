/**
 * Backpack Module
 *
 * Description: This module spawns a backpack heap with subsequent context
 * options for players to equip a backpack.
 */

#define THIS_MODULE base_backpack
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,list),THIS_MODULE\functions\fn_list.sqf);
__cppfln(FUNC(THIS_MODULE,take),THIS_MODULE\functions\fn_take.sqf);

MODULE(THIS_MODULE) = true;