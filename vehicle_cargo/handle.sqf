/**
 * Vehicle Cargo Module (Handler)
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_trigger"];

if (hasInterface) then {
    GVAR(loading) = false;

    _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerArea [0, 0, 0, true];
    _trigger setTriggerActivation ["NONE", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_vehicle_cargo_valid",
        "d_action_load = player addAction [format ['Load %1', [typeOf (d_load select 1)] call d_fnc_vehicle_name] call d_fnc_common_YellowText, 'vehicle_cargo\functions\fn_load.sqf', [], 9, false, true, '', 'player == _target && {player == vehicle player} && {!d_loading}']",
        "player removeAction d_action_load; d_loading = false"
    ];
};