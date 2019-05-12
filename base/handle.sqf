/**
 * Base Module (Handle)
 */

#define THIS_MODULE base
#include "x_macros.sqf"

if (isServer) then {
    _objects = [markerPos QGVAR(base_radar), random 0, ["radar","us_army"], 0, [
        "76n6ClamShell_EP1",
        "US_WarfareBAntiAirRadar_EP1"
    ]] call FUNC(common,objectMapper);
    
    ["base", _objects, markerPos QGVAR(base_radar)] call FUNC(server,spawnCrew);

    for "_i" from 1 to 2 do {
        _marker = format [QGVAR(base_anti_air_%1), _i];
        _objects = [markerPos _marker, random 0, ["anti-air","us_army"]] call FUNC(common,objectMapper);
        deleteVehicle ((nearestObjects [markerPos _marker, ["Land_CamoNetB_NATO_EP1"], 10]) select 0);
        
        ["base", _objects, markerPos _marker] call FUNC(server,spawnCrew);
    };
};