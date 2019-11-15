/**
 * Gesture Module
 *
 * Description: This module enables players to perform a list of gestures.
 */

#define THIS_MODULE gesture
#include "x_macros.sqf"

// Set list of gestures that can be performed as well as their cutoff duration.
GVAR(gesture_types) = [
    ["Bow", [
        ["c7a_bravoTOerc_idle15", 6]
    ]],
    
    ["Celebrate", [
        ["c7a_bravoTOerc_idle13", 20]
    ]],
    
    ["Clap", [
        ["c7a_bravoTOerc_idle17", 12]
    ]],
    
    ["Punch", [
        ["AmelPercMstpSnonWnonDnon_amaterUder1", 0]
    ]],
    
    ["Move Up", [
        ["AsigPercMstpSlowWrflDnon_GoGo", 0]
    ]],
    
    ["Wave Arms", [
        ["c7a_bravoTOerc_idle8", 11]
    ]]
];

__cppfln(FUNC(THIS_MODULE,play),THIS_MODULE\functions\fn_play.sqf);

MODULE(THIS_MODULE) = true;