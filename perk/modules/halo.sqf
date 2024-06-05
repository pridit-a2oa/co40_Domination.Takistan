/**
 * Perk Module - HALO Submodule
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
    "call d_fnc_halo_valid"
];