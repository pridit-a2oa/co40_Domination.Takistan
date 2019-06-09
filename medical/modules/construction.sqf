/**
 * Medical Module - Construction Submodule
 */

#define THIS_MODULE medical
#include "x_macros.sqf"
private ["_mash"];

PARAMS_1(_mash);

_mash addAction ["Replenish Medkits" call FUNC(common,BlueText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_medkits' < (player getVariable 'd_medkits_max') && {player getVariable 'd_medkits_max' > 0}"];