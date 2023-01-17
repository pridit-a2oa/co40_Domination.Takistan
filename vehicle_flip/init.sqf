/**
 * Vehicle Flip Module
 *
 * Description: This module enables a player to flip a vehicle, should it be
 * immobilised.
 */

#define THIS_MODULE vehicle_flip
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(flip), false];
};

__cppfln(FUNC(THIS_MODULE,flip),THIS_MODULE\functions\fn_flip.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;