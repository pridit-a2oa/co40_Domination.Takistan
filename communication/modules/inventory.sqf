/**
 * Communication Module - Inventory Submodule
 */

#include "x_macros.sqf"

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Inventory", [(count BIS_MENU_GroupCommunication) + 1], "", -5, [["expression", "execVM 'inventory\functions\fn_show.sqf'"]], "1", "1"]
];