/**
 * Teleport Module - Mission Main Submodule
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_flag"];

PARAMS_1(_flag);

waitUntil {sleep 0.1; !isNil {MODULE(common)}};

_flag addAction [
    "Fast Travel" call FUNC(common,YellowText),
    __function(show),
    [],
    2,
    false,
    true,
    "",
    "[player, vehicle player] call BIS_fnc_areEqual"
];