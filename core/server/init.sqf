/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,exitMap),core\THIS_MODULE\functions\fn_exitMap.sqf);
__cppfln(FUNC(THIS_MODULE,spawnVehicle),core\THIS_MODULE\functions\fn_spawnVehicle.sqf);

createCenter west;