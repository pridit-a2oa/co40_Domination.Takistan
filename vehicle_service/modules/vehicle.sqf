/**
 * Vehicle Service Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["Use Repair Kit" call FUNC(common,YellowText), __function(repair), [], -2, false, true, "", ""];