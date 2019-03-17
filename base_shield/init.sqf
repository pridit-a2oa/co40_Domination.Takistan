/**
 * Base Shield Module
 */

#define THIS_MODULE base_shield
#include "x_macros.sqf"

if (isServer) then {
    call compile preprocessFileLineNumbers __script(server);
};

if (hasInterface) then {
    call compile preprocessFileLineNumbers __script(client);
};

MODULE(THIS_MODULE) = true;