/**
 * Vehicle MHQ Module - Respawn Submodule
 */

#include "x_macros.sqf"

// Set distance within MASH to be able to respawn.
GVAR(mash_distance_respawn) = 300;

if (!isNil QMODULE(setting)) then {    
    player setVariable [QGVAR(respawn_types), (player getVariable QGVAR(respawn_types)) + [
        [format ["MASH (%1m)", GVAR(mash_distance_respawn)], "mash"]
    ]];
};