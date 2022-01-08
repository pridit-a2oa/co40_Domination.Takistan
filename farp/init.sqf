/**
 * FARP Module
 */

#define THIS_MODULE farp
#include "x_macros.sqf"

// Set the model
GVAR(farp_type) = "US_WarfareBVehicleServicePoint_Base_EP1";

// Set rotation of the model in relation to the player to apply when constructed
GVAR(farp_amount_rotation) = 90;

// Set time between constructing
GVAR(farp_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(farp), 0];
    player setVariable [QGVAR(farp_max), 0];
    
    if (isNil {player getVariable QGVAR(farp_time_cooldown)}) then {
        player setVariable [QGVAR(farp_time_cooldown), time + GVAR(farp_time_cooldown)];
    };
};

MODULE(THIS_MODULE) = true;