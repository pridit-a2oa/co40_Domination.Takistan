/**
 * Debug Module - Communication Submodule
 */

#define THIS_MODULE debug
#include "x_macros.sqf"

BIS_MENU_Debug = [
    ["Debug", false]
];

{
    private ["_name"];

    _name = _x select 1;

    call compile format ["BIS_MENU_Debug%1 = [];", _name];

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
    ],

    [
        "BIS_MENU_Debug",
        "Score",
        ["Increase (+5)", "Decrease (-5)"],
        "true",
        [
            "[gameLogic, ""addScore"", [player, 5]] call d_fnc_network_mp",
            "[gameLogic, ""addScore"", [player, -5]] call d_fnc_network_mp"
        ]
    ],

    [
        "BIS_MENU_Debug",
        "Time",
        ["Morning", "Afternoon", "Evening", "Night"],
        "true",
        [
            "[true, ""skipTime"", 8] call d_fnc_network_mp",
            "[true, ""skipTime"", 12] call d_fnc_network_mp",
            "[true, ""skipTime"", 18] call d_fnc_network_mp",
            "[true, ""skipTime"", 22] call d_fnc_network_mp"
        ]
    ]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Debug", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Debug", -5, [["expression", ""]], "1", "1"]
];

true