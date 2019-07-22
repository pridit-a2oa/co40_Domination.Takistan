/**
 * Vehicle Bonus Module
 *
 * Description: Set certain vehicle types to be handled differently, such as:
 * non-respawnable, wreck creation.
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"

// Set bonus vehicle types
GVAR(vehicle_bonus_types) = [
    "A10_US_EP1",
    "AH64D_EP1",
    "AW159_Lynx_BAF",
    "Mi24_D_TK_EP1",
    "L39_TK_EP1",
    "Su25_TK_EP1"
];

if (hasInterface) then {
    player setVariable [QGVAR(pilot), false];
};

MODULE(THIS_MODULE) = true;