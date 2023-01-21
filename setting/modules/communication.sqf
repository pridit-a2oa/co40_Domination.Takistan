/**
 * Setting Module - Communication Submodule
 */
 
BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Settings", [(count BIS_MENU_GroupCommunication) + 1], "", -5, [["expression", "execVM 'setting\functions\fn_show.sqf'"]], "1", "1"]
];

true