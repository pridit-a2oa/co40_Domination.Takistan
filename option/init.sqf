/**
 * Option Module
 *
 * Description: This module provides players with a shortcut to the
 * 'Communication' submenus.
 */

#define THIS_MODULE option
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);

MODULE(THIS_MODULE) = true;