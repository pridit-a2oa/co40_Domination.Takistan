/**
 * Vehicle Lift Module
 *
 * Description: This module enables players to physically attach land vehicles
 * to aircraft designated as lifts.
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"

// Set vehicle(s) as lift types
GVAR(vehicle_lift_types) = [
    "BAF_Merlin_HC3_D",
    "CH_47F_EP1",
    "Mi17_TK_EP1",
    "MV22"
];

__cppfln(FUNC(THIS_MODULE,lift),THIS_MODULE\functions\fn_lift.sqf);
__cppfln(FUNC(THIS_MODULE,release),THIS_MODULE\functions\fn_release.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;