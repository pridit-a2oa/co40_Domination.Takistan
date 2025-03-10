/**
 * Vehicle Module
 *
 * Description: This module is responsible for enhancing vehicles with
 * additional functionality. For all intents and purposes this is a core module,
 * just without being explicit.
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,offsetCreate),THIS_MODULE\functions\offsets\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,offsetPlayer),THIS_MODULE\functions\offsets\fn_player.sqf);
__cppfln(FUNC(THIS_MODULE,offsetTow),THIS_MODULE\functions\offsets\fn_tow.sqf);
__cppfln(FUNC(THIS_MODULE,offsetWreck),THIS_MODULE\functions\offsets\fn_wreck.sqf);

__cppfln(FUNC(THIS_MODULE,attach),THIS_MODULE\functions\fn_attach.sqf);
__cppfln(FUNC(THIS_MODULE,crew),THIS_MODULE\functions\fn_crew.sqf);
__cppfln(FUNC(THIS_MODULE,delete),THIS_MODULE\functions\fn_delete.sqf);
__cppfln(FUNC(THIS_MODULE,detach),THIS_MODULE\functions\fn_detach.sqf);
__cppfln(FUNC(THIS_MODULE,freeze),THIS_MODULE\functions\fn_freeze.sqf);
__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);
__cppfln(FUNC(THIS_MODULE,kind),THIS_MODULE\functions\fn_kind.sqf);
__cppfln(FUNC(THIS_MODULE,name),THIS_MODULE\functions\fn_name.sqf);
__cppfln(FUNC(THIS_MODULE,owner),THIS_MODULE\functions\fn_owner.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,respawn),THIS_MODULE\functions\fn_respawn.sqf);
__cppfln(FUNC(THIS_MODULE,speed),THIS_MODULE\functions\fn_speed.sqf);
__cppfln(FUNC(THIS_MODULE,stall),THIS_MODULE\functions\fn_stall.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;