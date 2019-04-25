/**
 * Communication Module
 *
 * Description: This module handles the management of the 'Communication'
 * context menu to provide players with additional options.
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

if (hasInterface) then {
    BIS_MENU_Squad = [
        ["Squad", false]
    ];

    BIS_MENU_Perks = [
        ["Perks", false]
    ];

    BIS_MENU_GroupCommunication = [
        ["Options", false],
        ["Squad",[11],"#USER:BIS_MENU_Squad",-5,[["expression",""]],"1","1"],
        ["Perks",[2],"#USER:BIS_MENU_Perks",-5,[["expression",""]],"1","1"]
    ];
};

__cppfln(FUNC(THIS_MODULE,add),THIS_MODULE\functions\fn_add.sqf);

MODULE(THIS_MODULE) = true;