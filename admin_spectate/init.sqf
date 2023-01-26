/**
 * Admin Spectate Module
 *
 * Description: This module provides the ability to spectate other players.
 */

#define THIS_MODULE admin_spectate
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,change),THIS_MODULE\functions\fn_change.sqf);
__cppfln(FUNC(THIS_MODULE,events),THIS_MODULE\functions\fn_events.sqf);
__cppfln(FUNC(THIS_MODULE,funcs),THIS_MODULE\functions\fn_funcs.sqf);
__cppfln(FUNC(THIS_MODULE,init),THIS_MODULE\functions\fn_init.sqf);

MODULE(THIS_MODULE) = true;