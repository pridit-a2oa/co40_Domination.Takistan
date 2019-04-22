/**
 * Vehicle Service Module (Handle)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

if (!isNil QMODULE(inventory)) then {
    __submodule(inventory);
};

{
    _x addAction ["Replenish Repair Kits" call FUNC(common,OliveText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_repair_kits' < 1 && {player getVariable 'd_repair_kits_max' > 0}"];
} forEach [SERVICE_POINT1, SERVICE_POINT2, SERVICE_POINT3];