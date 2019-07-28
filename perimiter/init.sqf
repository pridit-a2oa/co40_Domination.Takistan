/**
 * Perimiter Module
 *
 * Description: This module handles world boundary management.
 */

#define THIS_MODULE perimiter
#include "x_macros.sqf"

// Set the distance from the center to draw the boundary.
GVAR(perimiter_distance_center) = 9000;

// Set manual adjustment to align with the trigger.
GVAR(perimiter_amount_adjust) = 200;

// Set the width of each element encompassing the boundary.
GVAR(perimiter_amount_width) = 80;

__cppfln(FUNC(THIS_MODULE,outside),THIS_MODULE\functions\fn_outside.sqf);

MODULE(THIS_MODULE) = true;