/**
 * Perk Module - Halo Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction [
    "HALO Jump" call FUNC(common,YellowText),
    FUNCTION(halo,jump),
    [],
    -5,
    false,
    true,
    "",
    "(player getVariable 'd_halo' || ([(vehicle player) animationPhase ""ramp_bottom"", 1] call BIS_fnc_areEqual)) && {!([player, vehicle player] call BIS_fnc_areEqual) && {((getPos (vehicle player)) select 2) > d_halo_distance_minimum}}"
];