/**
 * Vehicle Menu Module
 */

#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;