/**
 * Vehicle Module
 *
 * Description: This module is responsible for enhancing vehicles with
 * additional functionality.
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,freeze),THIS_MODULE\functions\fn_freeze.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,speed),THIS_MODULE\functions\fn_speed.sqf);
__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

MODULE(THIS_MODULE) = true;