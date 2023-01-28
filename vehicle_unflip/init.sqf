/**
 * Vehicle Unflip Module
 *
 * Description: This module enables players to set vehicles upright.
 */

#define THIS_MODULE vehicle_unflip
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(unflip), false];
};

__cppfln(FUNC(THIS_MODULE,unflip),THIS_MODULE\functions\fn_unflip.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;