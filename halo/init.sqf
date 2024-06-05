/**
 * HALO Module
 *
 * Description: This module enables players to be able to perform a HALO jump
 * from a position of their choosing.
 */

#define THIS_MODULE halo
#include "x_macros.sqf"

// Set minimum height before option is available to use
GVAR(halo_distance_minimum) = 300;

if (hasInterface) then {
    player setVariable [QGVAR(halo), false];
};

BIS_fnc_halo = compile preprocessFile "halo\functions\bis\fn_halo.sqf"; // override BIS function

__cppfln(FUNC(THIS_MODULE,jump),THIS_MODULE\functions\fn_jump.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;