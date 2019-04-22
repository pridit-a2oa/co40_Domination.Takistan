/**
 * Base Wreck Module
 */

#define THIS_MODULE base_wreck
#include "x_macros.sqf"

// Set amount of wreck hangars
GVAR(wreck_hangars_max) = 3;

if (isServer) then {
    // Set wreck hangar object model
    GVAR(wreck_hangar_model) = "Land_Mil_hangar_EP1";
};

MODULE(THIS_MODULE) = true;