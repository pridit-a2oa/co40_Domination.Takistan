#define THIS_MODULE vehicle_flip
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["Flip" call FUNC(common,YellowText), __function(flip), [], -2, false, true, "", "player getVariable 'd_perkFlip' && {!(player in _target)} && {((vectorUp _target) select 2) < 0.6}"];