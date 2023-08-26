/**
 * Debug Module - Communication Submodule
 */

#define THIS_MODULE debug
#include "x_macros.sqf"

BIS_MENU_Debug = [
    ["Debug", false]
];

BIS_MENU_DebugCaptive = [];
BIS_MENU_DebugGroups = [];

{
    private ["_name"];

    _name = _x select 1;

    [
        BIS_MENU_Debug,
        [_name, [(count BIS_MENU_Debug) + 1], format ["#USER:BIS_MENU_Debug%1", _name], -5, [["expression", ""]], "1", "1"]
    ] call BIS_fnc_arrayPush;

    _x call FUNC(communication,options);
} forEach [
    [
        "BIS_MENU_Debug",
        "Captive",
        ["Enable", "Disable"],
        "captive player",
        "player setCaptive "
    ],

    [
        "BIS_MENU_Debug",
        "Groups",
        ["Show", "Hide"],
        "[d_debug_groups, 1] call BIS_fnc_areEqual",
        "d_debug_groups = "
    ]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Debug", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Debug", -5, [["expression", ""]], "1", "1"]
];

true