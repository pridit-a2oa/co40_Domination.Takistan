/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

// Set list of objects that should not be spawned as part of compositions
GVAR(server_objects_banned) = [
    "Land_CamoNetB_EAST_EP1",
    "Land_CamoNetB_NATO_EP1",
    "Land_CamoNetVar_EAST_EP1"
];

FUNC(THIS_MODULE,arrayPushStack) = {
    {if (!isNil "_x") then {(_this select 0) set [count (_this select 0), _x]}} foreach (_this select 1);
    (_this select 0)
};

__cppfln(FUNC(THIS_MODULE,exitMap),core\THIS_MODULE\functions\fn_exitMap.sqf);
__cppfln(FUNC(THIS_MODULE,objectMapper),core\THIS_MODULE\functions\fn_objectMapper.sqf);
__cppfln(FUNC(THIS_MODULE,spawnCrew),core\THIS_MODULE\functions\fn_spawnCrew.sqf);
__cppfln(FUNC(THIS_MODULE,spawnGroup),core\THIS_MODULE\functions\fn_spawnGroup.sqf);
__cppfln(FUNC(THIS_MODULE,spawnVehicle),core\THIS_MODULE\functions\fn_spawnVehicle.sqf);

createCenter west;
createCenter east;
createCenter civilian;
createCenter resistance;

west setFriend [east, 0.1];
west setFriend [resistance, 1];

east setFriend [west, 0.1];
east setFriend [resistance, 0.1];

resistance setFriend [west, 1];
resistance setFriend [east, 0.1];