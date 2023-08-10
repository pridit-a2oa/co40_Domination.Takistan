/**
 * HALO Module - Base HALO Submodule
 */

#define THIS_MODULE halo
#include "x_macros.sqf"

GVAR(flag) addAction ["HALO Jump" call FUNC(common,YellowText), __function(show), [], 1, false, true, "", ""];