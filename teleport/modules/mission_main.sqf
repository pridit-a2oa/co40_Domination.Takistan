/**
 * Teleport Module - Mission Main Submodule
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_flag"];

PARAMS_1(_flag);

waitUntil {!isNil {MODULE(common)}};

_flag addAction ["Fast Travel" call FUNC(common,YellowText), __function(show), [], 2, false, true, "", ""];