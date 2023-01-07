/**
 * Vehicle Bonus Module
 *
 * Description: Set certain vehicle types to be handled differently, such as:
 * non-respawnable, wreck creation.
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"

// Bonus vehicle types
GVAR(vehicle_bonus_types) = [
    "A10_US_EP1",
    "AH1Z",
    "AH64D_EP1",
    "AV8B2",
    "AW159_Lynx_BAF",
    "F35B",
    "Ka60_PMC",
    "L39_TK_EP1",
    "Mi24_D_TK_EP1",
    "Su25_TK_EP1"
];

if (hasInterface) then {
    player setVariable [QGVAR(pilot), false];
};

MODULE(THIS_MODULE) = true;