/**
 * Statistic Module
 *
 * Description: This module is responsible for tracking player statistics
 * attributed to various actions (database required).
 */

#define THIS_MODULE statistic
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(statistics), []];
};

__cppfln(FUNC(THIS_MODULE,get),THIS_MODULE\functions\fn_get.sqf);
__cppfln(FUNC(THIS_MODULE,key),THIS_MODULE\functions\fn_key.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);

MODULE(THIS_MODULE) = true;