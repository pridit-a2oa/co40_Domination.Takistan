/**
 * Core Module - Headless
 *
 * Description: This module is responsible for the handling of a headless
 * client.
 */

#define THIS_MODULE headless
#include "x_macros.sqf"

if (!hasInterface) then {
    if (!isDedicated) then {
        __cppfln(FUNC(server,spawnGroup),core\server\functions\fn_spawnGroup.sqf);
        __cppfln(FUNC(server,spawnVehicle),core\server\functions\fn_spawnVehicle.sqf);
        
        X_JIPH setVariable [QGVAR(headless), player, true];
    };
    
    "spawnGroup" addPublicVariableEventHandler {
        (_this select 1) call FUNC(server,spawnGroup);
    };

    "spawnVehicle" addPublicVariableEventHandler {
        (_this select 1) call FUNC(server,spawnVehicle);
    };
};

MODULE(THIS_MODULE) = true;