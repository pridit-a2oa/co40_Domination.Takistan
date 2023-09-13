/**
 * IED Module (Handler)
 */

#define THIS_MODULE ied
#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerArea [0, 0, 0, true];
    _trigger setTriggerActivation ["NONE", "PRESENT", true];
    _trigger setTriggerStatements [
        "_ied = [player] call d_fnc_ied_near; !isNil ""_ied"" && {!(_ied getVariable ""d_disarm"")}",
        "d_action_ied = player addAction ['Disarm IED' call d_fnc_common_RedText, 'ied\functions\fn_disarm.sqf', [player] call d_fnc_ied_near, 10, false, true, '', '[] call d_fnc_common_ready && {[speed player, 0] call BIS_fnc_areEqual}']",
        "player removeAction d_action_ied"
    ];
};