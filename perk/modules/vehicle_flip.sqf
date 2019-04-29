/**
 * Perk Module - Vehicle Flip Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction ["Flip" call FUNC(common,YellowText), FUNCTION(vehicle_flip,flip), _vehicle, 10, false, true, "", "player getVariable 'd_flip' && {!(player in _target)} && {((vectorUp _target) select 2) < 0.6}"];