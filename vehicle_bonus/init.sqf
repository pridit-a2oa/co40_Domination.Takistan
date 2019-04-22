/**
 * Vehicle Bonus Module
 *
 * Description: Set certain vehicle types to be handled differently, such as:
 * non-respawnable, wreck creation.
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(pilot), false];
};

MODULE(THIS_MODULE) = true;