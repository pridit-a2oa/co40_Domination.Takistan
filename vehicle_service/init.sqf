/**
 * Vehicle Service Module
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"

// Set service vehicles (inherent functionality)
GVAR(service_vehicles) = [
    "MtvrRefuel_DES_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRepair_DES_EP1"
];

__cppfln(FUNC(THIS_MODULE,repair),THIS_MODULE\functions\fn_repair.sqf);

[nil, player, "per", rAddAction, "Give Repair Kit" call FUNC(common,OliveText), FUNCTION(inventory,transfer), "RepairKits", 10, false, true, "", "['RepairKits', _target] call d_fnc_inventory_valid"] call RE;

if (!isNil QMODULE(perk)) then {
    __cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);
    
    {
        _x addAction ["Replenish Repair Kits" call FUNC(common,OliveText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_perkRepairKits' < 1 && {player getVariable 'd_perkRepairKitsMax' > 0}"];
    } forEach [SERVICE_POINT1, SERVICE_POINT2, SERVICE_POINT3];
};

MODULE(THIS_MODULE) = true;