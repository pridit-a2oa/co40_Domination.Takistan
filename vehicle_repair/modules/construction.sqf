/**
 * Vehicle Repair Module - Construction Submodule
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_farp"];

PARAMS_1(_farp);

_farp addAction ["Replenish Repair Kits" call FUNC(common,BlueText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_repair_kits' < 1 && {player getVariable 'd_repair_kits_max' > 0}"];