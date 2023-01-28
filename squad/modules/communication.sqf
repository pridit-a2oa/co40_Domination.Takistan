/**
 * Squad Module - Communication Submodule
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

BIS_MENU_Squad = [
    ["Squad", false]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Squad", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Squad", -5, [["expression", ""]], "1", "1"]
];

[group player] call FUNC(THIS_MODULE,populate);

true