/**
 * Vehicle Repair Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction ["Use Repair Kit" call FUNC(common,YellowText), __function(repair), [], 10, false, true, "", "!(player in _target) && {vehicle player == player} && {player getVariable 'd_repair_kits' > 0} && {!canMove _target || damage _target >= d_vehicle_repair_amount_damage || fuel _target < d_vehicle_repair_amount_fuel}"];