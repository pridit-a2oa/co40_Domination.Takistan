/**
 * Perk Module - Communication Submodule
 */

BIS_MENU_Radio = [
    ["Radio", false]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Radio", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Radio", -5, [["expression", ""]], "1", "0"]
];