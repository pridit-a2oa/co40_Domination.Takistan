/**
 * Helper Module
 *
 * Description: This module provides helper functions that can be used across
 * all modules.
 */

#define THIS_MODULE helper
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,distanceFrom),core\THIS_MODULE\functions\fn_distanceFrom.sqf);
__cppfln(FUNC(THIS_MODULE,greaterThan),core\THIS_MODULE\functions\fn_greaterThan.sqf);
__cppfln(FUNC(THIS_MODULE,inAir),core\THIS_MODULE\functions\fn_inAir.sqf);
__cppfln(FUNC(THIS_MODULE,inProgress),core\THIS_MODULE\functions\fn_inProgress.sqf);
__cppfln(FUNC(THIS_MODULE,inVehicle),core\THIS_MODULE\functions\fn_inVehicle.sqf);
__cppfln(FUNC(THIS_MODULE,isDamaged),core\THIS_MODULE\functions\fn_isDamaged.sqf);
__cppfln(FUNC(THIS_MODULE,isDuplicate),core\THIS_MODULE\functions\fn_isDuplicate.sqf);
__cppfln(FUNC(THIS_MODULE,isObstructed),core\THIS_MODULE\functions\fn_isObstructed.sqf);
__cppfln(FUNC(THIS_MODULE,isOccupied),core\THIS_MODULE\functions\fn_isOccupied.sqf);
__cppfln(FUNC(THIS_MODULE,isSlope),core\THIS_MODULE\functions\fn_isSlope.sqf);
__cppfln(FUNC(THIS_MODULE,nearAny),core\THIS_MODULE\functions\fn_nearAny.sqf);
__cppfln(FUNC(THIS_MODULE,nearBuilding),core\THIS_MODULE\functions\fn_nearBuilding.sqf);
__cppfln(FUNC(THIS_MODULE,nearObject),core\THIS_MODULE\functions\fn_nearObject.sqf);
__cppfln(FUNC(THIS_MODULE,nearSide),core\THIS_MODULE\functions\fn_nearSide.sqf);
__cppfln(FUNC(THIS_MODULE,timeExceeded),core\THIS_MODULE\functions\fn_timeExceeded.sqf);

MODULE(THIS_MODULE) = true;