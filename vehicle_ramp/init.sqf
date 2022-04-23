/**
 * Vehicle Ramp Module
 *
 * Description: This module facilitates lowering and raising of
 * vehicle ramps.
 */

#define THIS_MODULE vehicle_ramp
#include "x_macros.sqf"

// Set vehicles with the ability to raise/lower ramps.
GVAR(vehicle_ramp_types) = [
    "C130J_US_EP1",
    "MV22"
];

__cppfln(FUNC(THIS_MODULE,toggle),THIS_MODULE\functions\fn_toggle.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;