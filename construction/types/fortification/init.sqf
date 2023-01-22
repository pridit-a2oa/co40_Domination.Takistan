/**
 * Construction - Fortification Module
 */

#define THIS_MODULE construction_fortification
#include "x_macros.sqf"

// Type of construction, object, and (optional) representative icon texture
GVAR(construction_types) = GVAR(construction_types) + [
    [
        "Fortification",
        "Land_fort_rampart_EP1",
        "ca\ui\data\stats_total_ca"
    ]
];

// Rotation of the model in relation to the player to apply when constructed
GVAR(construction_fortification_amount_rotation) = 0;

MODULE(THIS_MODULE) = true;