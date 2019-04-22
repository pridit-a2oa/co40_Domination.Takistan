/**
 * Squad Module
 *
 * Description: This module enables players to join & leave the squads of their
 * teammates.
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,join),THIS_MODULE\functions\fn_join.sqf);
__cppfln(FUNC(THIS_MODULE,leave),THIS_MODULE\functions\fn_leave.sqf);

MODULE(THIS_MODULE) = true;