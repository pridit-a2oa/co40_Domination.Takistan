/**
 * Item - Evidence Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    private ["_trigger"];
    
    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(intel)];
    _trigger setTriggerArea [11, 9, 149.9, true];
    _trigger setTriggerActivation ["WEST", "PRESENT", true];
    _trigger setTriggerStatements [
        "this && {player in thisList}",
        "[d_item_evidence_type select 1] call d_fnc_item_evidence_reward",
        ""
    ];
};