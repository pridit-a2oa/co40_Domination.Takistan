/**
 * Helper Module
 *
 * Description: This module provides helper functions that can be used across
 * all modules.
 */

#define THIS_MODULE helper
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,distanceFrom),core\THIS_MODULE\functions\fn_distanceFrom.sqf);
__cppfln(FUNC(THIS_MODULE,inProgress),core\THIS_MODULE\functions\fn_inProgress.sqf);
__cppfln(FUNC(THIS_MODULE,inVehicle),core\THIS_MODULE\functions\fn_inVehicle.sqf);
__cppfln(FUNC(THIS_MODULE,nearSide),core\THIS_MODULE\functions\fn_nearSide.sqf);
__cppfln(FUNC(THIS_MODULE,timeExceeded),core\THIS_MODULE\functions\fn_timeExceeded.sqf);

MODULE(THIS_MODULE) = true;