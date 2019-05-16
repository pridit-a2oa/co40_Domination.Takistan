/**
 * Construction Module
 *
 * Description: This module enables players to place objects, functional or
 * static, within the world.
 */

#define THIS_MODULE construction
#include "x_macros.sqf"

// Minimum distance from base
GVAR(construction_distance_base) = 800;

// Minimum distance all players must exceed before despawning an object
GVAR(construction_distance_cleanup) = 300;

// Minimum distance from an object of the same type
GVAR(construction_distance_identical) = 300;

// Time before despawning a constructed object
GVAR(construction_time_lifetime) = 1800;

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,consume),THIS_MODULE\functions\fn_consume.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,deconstruct),THIS_MODULE\functions\fn_deconstruct.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;