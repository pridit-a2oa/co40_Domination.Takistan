/**
 * Vehicle Service Module - Construction Submodule
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_farp"];

PARAMS_1(_farp);

_farp addAction ["Replenish Repair Kits" call FUNC(common,OliveText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_repair_kits' < 1 && {player getVariable 'd_repair_kits_max' > 0}"];