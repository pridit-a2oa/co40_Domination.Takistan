/**
 * Vehicle Load Module (Handler)
 */

#define THIS_MODULE vehicle_load
#include "x_macros.sqf"
private ["_trigger"];

if (isServer) then {
    for "_i" from 1 to GVAR(vehicle_load_amount_max) do {
        _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
        _trigger setTriggerArea [0, 0, 0, true];
        _trigger setTriggerActivation ["NONE", "PRESENT", true];
        _trigger setTriggerStatements [
            format ["call d_fnc_vehicle_load_valid && player getVariable 'd_vehicle_load' == %1", _i],
            "d_action = player addAction [format ['Load %1', getText (configFile >> 'cfgVehicles' >> (typeOf (d_load select 1)) >> 'displayName')]  call d_fnc_common_YellowText, 'vehicle_load\functions\fn_load.sqf', [], 9, false, true, '', 'player == vehicle player']",
            "player removeAction d_action"
        ];
    };
};