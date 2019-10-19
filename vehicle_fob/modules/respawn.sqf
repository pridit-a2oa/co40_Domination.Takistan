/**
 * Vehicle FOB Module - Respawn Submodule
 */

#include "x_macros.sqf"

// Set distance within deployed FOB to be able to respawn.
GVAR(vehicle_fob_distance_respawn) = 6000;

if (!isNil QMODULE(setting)) then {    
    player setVariable [QGVAR(respawn_types), (player getVariable QGVAR(respawn_types)) + [
        [format ["FOB (%1km)", GVAR(vehicle_fob_distance_respawn) / 1000], "fob"]
    ]];
};