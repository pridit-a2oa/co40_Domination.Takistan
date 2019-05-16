/**
 * Vehicle Tow Module (Handler)
 */

#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_trigger"];

"tow" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,tow);
};

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerArea [0, 0, 0, true];
    _trigger setTriggerActivation ["NONE", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_vehicle_tow_valid",
        "d_action_tow = [(vehicle player), d_tow] call d_fnc_vehicle_tow_action",
        "(vehicle player) removeAction d_action_tow; (nearestObject [player, d_vehicle_tow_type]) removeAction d_action_tow; d_tow = nil"
    ];
};