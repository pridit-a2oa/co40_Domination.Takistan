/**
 * FARP Module
 */

#define THIS_MODULE farp
#include "x_macros.sqf"

// FARP type
GVAR(farp_type) = "US_WarfareBVehicleServicePoint_Base_EP1";

// Time between building
GVAR(farp_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(farp), 0];
    player setVariable [QGVAR(farp_max), 0];
    player setVariable [QGVAR(farp_cooldown), time + GVAR(farp_cooldown)];
};

MODULE(THIS_MODULE) = true;