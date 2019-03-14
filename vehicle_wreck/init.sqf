/**
 * Vehicle Wreck Module
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

if (hasInterface) then {
    call compile preprocessFileLineNumbers __script(client);
};

if (isServer) then {
    call compile preprocessFileLineNumbers __script(server);
};

MODULE(THIS_MODULE) = true;