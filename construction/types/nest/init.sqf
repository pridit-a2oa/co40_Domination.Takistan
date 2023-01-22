/**
 * Construction - (MG) Nest Module
 */

#define THIS_MODULE construction_nest
#include "x_macros.sqf"

// Type of construction, object, and (optional) representative icon texture
GVAR(construction_types) = GVAR(construction_types) + [
    [
        "Nest",
        "WarfareBMGNest_M240_US_EP1",
        "ca\ui\data\iconmg_ca"
    ]
];

// Rotation of the model in relation to the player to apply when constructed
GVAR(construction_nest_amount_rotation) = 0;

MODULE(THIS_MODULE) = true;