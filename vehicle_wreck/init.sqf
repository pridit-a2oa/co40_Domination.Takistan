/**
 * Vehicle Wreck Module
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Set vehicle wreck
GVAR(vehicle_wreck_types) = [
    "UH60M_MEV_EP1"
];

if (isServer) then {
    call compile preprocessFileLineNumbers __script(server);
};

if (hasInterface) then {
    call compile preprocessFileLineNumbers __script(client);
};

MODULE(THIS_MODULE) = true;