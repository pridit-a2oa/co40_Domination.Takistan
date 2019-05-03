/**
 * Vehicle Load Module (Handler)
 */

#define THIS_MODULE vehicle_load
#include "x_macros.sqf"
private ["_trigger"];

if (hasInterface) then {
    GVAR(loading) = false;
    
    _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerArea [0, 0, 0, true];
    _trigger setTriggerActivation ["NONE", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_vehicle_load_valid",
        "d_action = player addAction [format ['Load %1', getText (configFile >> 'cfgVehicles' >> (typeOf (d_load select 1)) >> 'displayName')] call d_fnc_common_YellowText, 'vehicle_load\functions\fn_load.sqf', [], 9, false, true, '', 'player == vehicle player && {!d_loading}']",
        "player removeAction d_action; d_loading = false"
    ];
};