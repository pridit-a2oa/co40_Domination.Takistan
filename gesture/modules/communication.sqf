/**
 * Gesture Module - Communication Submodule
 */

#include "x_macros.sqf"

BIS_MENU_Gestures = [
    ["Gestures", false]
];

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Gestures", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Gestures", -5, [["expression", ""]], "1", "1"]
];

{
    [
        BIS_MENU_Gestures,
        _x select 0,
        "",
        format [
            "['%1', %2] spawn d_fnc_gesture_play",
            _x select 1,
            _x select 2
        ]
    ] call FUNC(communication,add);
} forEach GVAR(gesture_types);