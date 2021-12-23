/**
 * Vehicle Repair Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction [
    "Use Repair Kit" call FUNC(common,YellowText),
    __function(repair),
    [],
    10,
    false,
    true,
    "",
    "[_target] call d_fnc_vehicle_repair_valid"
];