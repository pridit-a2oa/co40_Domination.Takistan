/**
 * Intel Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    private ["_trigger"];
    
    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(intel)];
    _trigger setTriggerArea [11, 9, 149.9, true];
    _trigger setTriggerActivation ["WEST", "PRESENT", true];
    _trigger setTriggerStatements [
        "this && {player in thisList && {!isNil ""d_mdl_item"" && {[d_intel_type_item] call d_fnc_item_valid}}}",
        "call d_fnc_intel_reward",
        ""
    ];
};