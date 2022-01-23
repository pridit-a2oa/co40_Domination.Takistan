/**
 * Base 3D Module
 *
 * Description: This module is responsible for specific placement
 * of 3D text in the base.
 */

#define THIS_MODULE base_3d
#include "x_macros.sqf"

// Set list of objects that can have 3D text.
GVAR(base_3d_type_objects) = [
    "HeliH",
    "HeliHEmpty"
];

__cppfln(FUNC(THIS_MODULE,description),THIS_MODULE\functions\fn_description.sqf);

MODULE(THIS_MODULE) = true;