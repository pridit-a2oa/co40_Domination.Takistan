/**
 * Halo Module - Base Halo Submodule
 */

#define THIS_MODULE halo
#include "x_macros.sqf"

GVAR(flag) addAction ["HALO Jump" call FUNC(common,OliveText), __function(show), [], 1, false, true, "", ""];