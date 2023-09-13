/**
 * Core Module - Client
 */

#define THIS_MODULE client
#include "x_macros.sqf"

GVAR(perframe_store) = "HeliHEmpty" createVehicleLocal [0,0,0];
GVAR(perframe_array) = [];
GVAR(perframe_previous) = -999;

// Invulnerability window upon respawning
GVAR(client_time_invulnerable) = 10;

__cppfln(FUNC(THIS_MODULE,addPerFrame),core\THIS_MODULE\functions\fn_addPerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,perFrame),core\THIS_MODULE\functions\fn_perFrame.sqf);
__cppfln(FUNC(THIS_MODULE,removePerFrame),core\THIS_MODULE\functions\fn_removePerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,reveal),core\THIS_MODULE\functions\fn_reveal.sqf);
__cppfln(FUNC(THIS_MODULE,stall),core\THIS_MODULE\functions\fn_stall.sqf);

MODULE(THIS_MODULE) = true;