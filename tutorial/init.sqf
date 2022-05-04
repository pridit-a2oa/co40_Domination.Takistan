/**
 * Tutorial Module
 *
 * Description: This module provides a slideshow tutorial to players
 * showing points of interest.
 */

#define THIS_MODULE tutorial
#include "x_macros.sqf"

if (hasInterface) then {
    GVAR(tutorial) = true;
};

__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);
__cppfln(FUNC(THIS_MODULE,play),THIS_MODULE\functions\fn_play.sqf);

MODULE(THIS_MODULE) = true;