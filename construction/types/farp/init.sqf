/**
 * Construction - FARP Module
 */

#define THIS_MODULE construction_farp
#include "x_macros.sqf"

// Type of construction, object, and (optional) representative icon texture
GVAR(construction_types) = GVAR(construction_types) + [
    [
        "FARP",
        "US_WarfareBVehicleServicePoint_Base_EP1",
        "ca\ui\data\icon_mission_repair_ca"
    ]
];

// Rotation of the model in relation to the player to apply when constructed
GVAR(construction_farp_amount_rotation) = 90;

MODULE(THIS_MODULE) = true;