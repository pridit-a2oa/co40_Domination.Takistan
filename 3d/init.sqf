/**
 * 3D Module
 *
 * Description: This module is responsible for the handling of 3D text
 * in the world.
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"

// Set rsc layer to start from
GVAR(3d_type_layer) = 2733;

// Set default maximum distance before fading
GVAR(3d_distance_fade) = 1.8;

// Set default maximum distance before being visible
GVAR(3d_distance_visible) = 12;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,time),THIS_MODULE\functions\fn_time.sqf);

MODULE(THIS_MODULE) = true;