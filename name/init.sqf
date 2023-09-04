/**
 * Name Module
 *
 * Description: This module adds persistent player markers that change
 * depending on state.
 */

#define THIS_MODULE name
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;