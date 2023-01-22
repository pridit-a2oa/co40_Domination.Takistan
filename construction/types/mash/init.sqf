/**
 * Construction - MASH Module
 */

#define THIS_MODULE construction_mash
#include "x_macros.sqf"

// Type of construction, object, and (optional) representative icon texture
GVAR(construction_types) = GVAR(construction_types) + [
    [
        "MASH",
        "MASH_EP1",
        "ca\ui\data\icon_unit_agony_ca"
    ]
];

// Rotation of the model in relation to the player to apply when constructed
GVAR(construction_mash_amount_rotation) = 180;

MODULE(THIS_MODULE) = true;