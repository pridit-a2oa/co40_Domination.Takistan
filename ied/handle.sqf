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
        "!isNil {[player] call d_fnc_ied_near} && {player getVariable 'd_ied'}",
        "d_action_ied = player addAction ['Disarm IED' call d_fnc_common_RedText, 'ied\functions\fn_disarm.sqf', [player] call d_fnc_ied_near, 10, false, true, '', 'player == _target && {player == vehicle player} && {speed player == 0}']",
        "player removeAction d_action_ied"
    ];
};