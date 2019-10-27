/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

// Set list of objects that should not be spawned as part of compositions
GVAR(server_objects_banned) = [
    "Barrel1",
    "Barrel4",
    "Barrel5",
    "Barrels",
    "Land_Barrel_sand",
    "Land_CamoNetB_EAST_EP1",
    "Land_CamoNetB_NATO_EP1",
    "Land_CamoNetVar_EAST_EP1",
    "USBasicAmmunitionBox_EP1",
    "USVehicleBox_EP1"
];

__cppfln(FUNC(THIS_MODULE,arrayPushStack),core\THIS_MODULE\functions\fn_arrayPushStack.sqf);
__cppfln(FUNC(THIS_MODULE,exitMap),core\THIS_MODULE\functions\fn_exitMap.sqf);
__cppfln(FUNC(THIS_MODULE,objectId),core\THIS_MODULE\functions\fn_objectId.sqf);
__cppfln(FUNC(THIS_MODULE,objectMapper),core\THIS_MODULE\functions\fn_objectMapper.sqf);
__cppfln(FUNC(THIS_MODULE,spawnGroup),core\THIS_MODULE\functions\fn_spawnGroup.sqf);
__cppfln(FUNC(THIS_MODULE,spawnVehicle),core\THIS_MODULE\functions\fn_spawnVehicle.sqf);

enableSaving [false, false];
enableTeamSwitch false;

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

0 spawn {
    while {true} do {
        sleep 30;
        
        {
            if (GVAR(playable) find (str _x) != -1) then {
                if !(isPlayer _x) then {
                    _x call FUNC(client,endMission);
                    
                    __log format ["Playable unit without player (%1) [%2] - killed", str _x, name _x]];
                };
            };
        } forEach allUnits;
    };
};

MODULE(THIS_MODULE) = true;