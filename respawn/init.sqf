/**
 * Respawn Module
 */

#define THIS_MODULE respawn
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(respawn_type), [0, "base"]];
    player setVariable [QGVAR(respawn_types), [
        ["Base", "base"]
    ]];
};

__cppfln(FUNC(THIS_MODULE,spawn),THIS_MODULE\functions\fn_spawn.sqf);

MODULE(THIS_MODULE) = true;