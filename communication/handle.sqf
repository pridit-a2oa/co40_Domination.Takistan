/**
 * Communication Module (Handler)
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

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