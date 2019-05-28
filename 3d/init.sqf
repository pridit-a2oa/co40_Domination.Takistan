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

// Set maximum distance before being visible
GVAR(3d_distance_visible) = 12;

// Set maximum distance before fading
GVAR(3d_distance_fade) = 1.8;

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;