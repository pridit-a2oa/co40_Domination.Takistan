/**
 * Medical Module - Construction Submodule
 */

#define THIS_MODULE medical
#include "x_macros.sqf"
private ["_mash"];

PARAMS_1(_mash);

_mash addAction ["Replenish Medkits" call FUNC(common,OliveText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_medkits' < 1 && {player getVariable 'd_medkits_max' > 0}"];