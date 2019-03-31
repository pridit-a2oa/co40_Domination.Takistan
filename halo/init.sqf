/**
 * Halo Module
 */

#define THIS_MODULE halo
#include "x_macros.sqf"

if (isServer) then {
    waitUntil {!(isNil "bis_fnc_init")};
};

BIS_fnc_halo = compile preprocessFile "halo\functions\bis\fn_halo.sqf"; // override BIS function

__cppfln(FUNC(THIS_MODULE,jump),THIS_MODULE\functions\fn_jump.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);

MODULE(THIS_MODULE) = true;