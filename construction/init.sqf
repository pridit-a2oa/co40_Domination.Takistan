/**
 * Construction Module
 *
 * Description: This module enables players to place objects, functional or
 * static, within the world.
 */

#define THIS_MODULE construction
#include "x_macros.sqf"

// Time before despawning a constructed object
GVAR(construction_time_lifetime) = 1800;

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;