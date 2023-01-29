/**
 * Intel Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(intel)];
    _trigger setTriggerArea [11, 9, 149.9, true];
    _trigger setTriggerActivation ["WEST", "PRESENT", true];
    _trigger setTriggerStatements [
        "this && {player in thisList && {call d_fnc_intel_valid}}",
        "call d_fnc_intel_process",
        ""
    ];
};