/**
 * Construction Module - Communication Submodule
 */

BIS_MENU_Construct = [
    ["Construct", false]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Construct", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Construct", -5, [["expression", ""]], "1", "0"]
];