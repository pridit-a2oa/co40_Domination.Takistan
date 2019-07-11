/**
 * Vehicle MHQ Module - Respawn Submodule
 */

#include "x_macros.sqf"
private ["_types"];

if (!isNil QMODULE(setting)) then {    
    player setVariable [QGVAR(respawn_types), (player getVariable QGVAR(respawn_types)) + [["Mobile HQ", "mhq"]]];
};