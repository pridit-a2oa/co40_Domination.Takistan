/**
 * Vehicle Service Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["Use Repair Kit" call FUNC(common,YellowText), __function(repair), _vehicle, -2, false, true, "", "!(player in _target) && {player getVariable 'd_perkRepairKits' > 0} && {!canMove _target || damage _target >= 0.3 || fuel _target < 0.25}"];