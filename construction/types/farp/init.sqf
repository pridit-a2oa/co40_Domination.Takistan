/**
 * Construction - FARP Module
 */

#define THIS_MODULE construction_farp
#include "x_macros.sqf"

// Set object of construction
GVAR(construction_farp_object) = "US_WarfareBVehicleServicePoint_Base_EP1";

if (hasInterface) then {
    player setVariable [QGVAR(farp_type), GVAR(construction_farp_object)];
};

[
    GVAR(construction_types),
    [
        "FARP",
        [[GVAR(construction_farp_object), 90]],
        "ca\ui\data\icon_mission_repair_ca"
    ]
] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;