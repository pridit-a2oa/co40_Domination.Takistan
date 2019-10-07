/**
 * Vehicle Module
 *
 * Description: This module is responsible for enhancing vehicles with
 * additional functionality. For all intents and purposes this is a core module,
 * just without being explicit.
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,delete),THIS_MODULE\functions\fn_delete.sqf);
__cppfln(FUNC(THIS_MODULE,freeze),THIS_MODULE\functions\fn_freeze.sqf);
__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);
__cppfln(FUNC(THIS_MODULE,speed),THIS_MODULE\functions\fn_speed.sqf);

MODULE(THIS_MODULE) = true;