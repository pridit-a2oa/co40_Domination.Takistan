/**
 * Marker Module
 */

#define THIS_MODULE marker
#include "x_macros.sqf"

// Maximum distance from original spawn position before visible
GVAR(vehicle_distance_visible) = 10;

__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;