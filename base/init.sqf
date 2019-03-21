/**
 * Base Upgrade Module
 */

#define THIS_MODULE base
#include "x_macros.sqf"

[markerPos QGVAR(base_radar), random 0, ["radar","us_army"], 0, [
    "76n6ClamShell_EP1",
    "US_WarfareBAntiAirRadar_EP1"
]] call FUNC(common,objectMapper);

for "_i" from 1 to 2 do {
    _marker = format [QGVAR(base_anti_air%1), _i];
    [markerPos _marker, random 0, ["anti-air","us_army"]] call FUNC(common,objectMapper);
    deleteVehicle ((nearestObjects [markerPos _marker, ["Land_CamoNetB_NATO_EP1"], 10]) select 0);
};

// _dgrp = ["WEST"] call FUNC(creategroup);
// _unit_array = ["basic", "WEST"] call FUNC(getunitliste);
// [GVAR(base_radar_pos), _unit_array select 0, _dgrp, true] call FUNC(makemgroup);
// [_dgrp, GVAR(base_radar_pos)] call FUNC(taskDefend);

MODULE(THIS_MODULE) = true;