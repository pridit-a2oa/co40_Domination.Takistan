/**
 * Base Module
 *
 * Description: This module enhances the base with objects and defenses.
 */

#define THIS_MODULE base
#include "x_macros.sqf"

// Objects which cannot be destroyed
GVAR(base_types_protected) = [
    "Base_WarfareBBarrier10xTall",
    "Land_BagFenceLong",
    "Land_HBarrier5",
    "Land_runway_edgelight",
    "US_WarfareBAntiAirRadar_EP1"
];

MODULE(THIS_MODULE) = true;