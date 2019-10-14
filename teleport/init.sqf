/**
 * Teleport Module
 *
 * Description: This module enables players to teleport to points of interest
 * on the map.
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

// Set animation timing and zoom level for map dialog transitions.
GVAR(teleport_type_animations) = [
    [1, 0.07],
    [0.4, 0.04]
];

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,target),THIS_MODULE\functions\fn_target.sqf);

MODULE(THIS_MODULE) = true;