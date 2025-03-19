/**
 * Perimeter Module
 *
 * Description: This module handles world boundary management.
 */

#define THIS_MODULE perimeter
#include "x_macros.sqf"

// Manual adjustment to align with the trigger
GVAR(perimeter_amount_adjust) = 200;

// The width of each element encompassing the boundary
GVAR(perimeter_amount_width) = 7000;

// The distance from the center to draw the boundary
GVAR(perimeter_distance_center) = GVAR(perimeter_amount_width) + 9000;

__cppfln(FUNC(THIS_MODULE,outside),THIS_MODULE\functions\fn_outside.sqf);

MODULE(THIS_MODULE) = true;