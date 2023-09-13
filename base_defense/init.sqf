/**
 * Base Defense Module
 *
 * Description: This module enhances the base with objects and defenses.
 */

#define THIS_MODULE base_defense
#include "x_macros.sqf"

// Objects which cannot be destroyed
GVAR(base_defense_types_protected) = [
    "Fort_RazorWire",
    "Land_BagFenceLong",
    "Land_HBarrier5",
    "Land_runway_edgelight",
    "US_WarfareBAntiAirRadar_EP1",
    "US_WarfareBBarrier10xTall_EP1"
];

MODULE(THIS_MODULE) = true;