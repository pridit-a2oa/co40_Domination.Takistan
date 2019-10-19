/**
 * Debug Module
 *
 * Description: This module provides additional information during gameplay.
 */

#define THIS_MODULE debug
#include "x_macros.sqf"

if (hasInterface) then {
    GVAR(markers) = [];
};

__cppfln(FUNC(THIS_MODULE,compositions),THIS_MODULE\functions\fn_compositions.sqf);
__cppfln(FUNC(THIS_MODULE,groups),THIS_MODULE\functions\fn_groups.sqf);
__cppfln(FUNC(THIS_MODULE,performance),THIS_MODULE\functions\fn_performance.sqf);

MODULE(THIS_MODULE) = true;