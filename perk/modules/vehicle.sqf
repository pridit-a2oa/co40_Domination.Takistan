/**
 * Perk Module - Vehicle Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["My Perks" call FUNC(common,GreyText), __function(show), [], -9, false, true, "", "player in _target"];