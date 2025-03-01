/**
 * Teleport Module
 *
 * Description: This module enables players to teleport to points of interest
 * on the map.
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

// The static object to associate the action to
GVAR(teleport_type_object) = "FlagCarrierUSA_EP1";

// Animation timing and zoom level for map dialog transitions
GVAR(teleport_type_animations) = [
    [1, 0.07],
    [0.4, 0.04]
];

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,target),THIS_MODULE\functions\fn_target.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;