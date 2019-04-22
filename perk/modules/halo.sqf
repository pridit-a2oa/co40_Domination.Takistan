/**
 * Perk Module - Halo Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["HALO Jump" call FUNC(common,YellowText), FUNCTION(halo,jump), [], 10, false, true, "", "player getVariable 'd_halo' && {vehicle player != player} && {((getPos (vehicle player)) select 2) > 100}"];