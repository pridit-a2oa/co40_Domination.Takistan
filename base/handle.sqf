/**
 * Base Module (Handle)
 */

#define THIS_MODULE base
#include "x_macros.sqf"

if (isServer) then {
    [west, markerPos QGVAR(base_radar), random 0, ["radar", "us_army"], 0, [
        "76n6ClamShell_EP1",
        "US_WarfareBAntiAirRadar_EP1"
    ]] spawn FUNC(server,objectMapper);

    for "_i" from 1 to 2 do {
        _marker = format [QGVAR(base_anti_air_%1), _i];
        
        [west, markerPos _marker, random 0, ["anti-air", "us_army"]] spawn FUNC(server,objectMapper);
    };
};