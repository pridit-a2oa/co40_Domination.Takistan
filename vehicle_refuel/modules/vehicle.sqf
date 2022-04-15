/**
 * Vehicle Fuel Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction [
    "Use Fuel Can" call FUNC(common,BlueText),
    __function(refuel),
    [],
    10,
    false,
    true,
    "",
    "[_target] call d_fnc_vehicle_refuel_valid"
];

if !([typeOf _vehicle, GVAR(fuel_type_vehicle)] call BIS_fnc_areEqual) exitWith {};

_vehicle addAction ["Take Fuel Can" call FUNC(common,BlueText), __function(replenish), [], 2, false, true, "", "player == (vehicle player) && {player getVariable 'd_fuel_cans' < (player getVariable 'd_fuel_cans_max')} && {player getVariable 'd_fuel_cans_max' > 0}"];