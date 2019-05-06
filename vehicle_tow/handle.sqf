/**
 * Vehicle Tow Module (Handler)
 */

#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_trigger"];

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerArea [0, 0, 0, true];
    _trigger setTriggerActivation ["NONE", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_vehicle_tow_valid",
        "d_action_tow = (vehicle player) addAction [format ['Tow %1', [typeOf (d_tow)] call d_fnc_vehicle_name] call d_fnc_common_YellowText, 'vehicle_tow\functions\fn_tow.sqf', d_tow, 9, false, true, '', 'player == driver _target && {(typeOf _target) == d_vehicle_tow_type} && {!(d_tow getVariable ""d_is_towed"")}']",
        "(vehicle player) removeAction d_action_tow; (nearestObject [player, d_vehicle_tow_type]) removeAction d_action_tow; d_tow = nil"
    ];
};