/**
 * Squad Module - Communication Submodule
 */

BIS_MENU_Squad = [
    ["Squad", false]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Squad", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Squad", -5, [["expression", ""]], "1", "1"]
];

true