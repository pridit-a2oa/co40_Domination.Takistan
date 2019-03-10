/**
 * Base Shield Module
 */

#define THIS_MODULE base_shield
#include "x_macros.sqf"

if (GVAR(jip_started)) exitWith {
    call compile preprocessFileLineNumbers __script(client)
};

call compile preprocessFileLineNumbers __script(server)