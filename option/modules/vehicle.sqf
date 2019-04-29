/**
 * Option Module - Vehicle Submodule
 */

#define THIS_MODULE option
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction ["Options" call FUNC(common,GreyText), __function(show), [], -9, false, true, "", "player in _target"];