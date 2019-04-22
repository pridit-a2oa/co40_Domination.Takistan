/**
 * Perk Module - Vehicle Service Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["Use Repair Kit" call FUNC(common,YellowText), FUNCTION(vehicle_service,repair), _vehicle, 10, false, true, "", "!(player in _target) && {vehicle player == player} && {player getVariable 'd_repair_kits' > 0} && {!canMove _target || damage _target >= 0.3 || fuel _target < 0.10}"];