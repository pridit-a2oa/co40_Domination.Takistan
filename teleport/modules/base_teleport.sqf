/**
 * Teleport Module - Base Teleport Submodule
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

GVAR(flag) addAction ["Teleport" call FUNC(common,OliveText), __function(show), [], 2, false, true, "", ""];