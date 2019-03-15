/**
 * Vehicle Protection Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_protection
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (side _vehicle != east && {_vehicle isKindOf "Car" || _vehicle isKindOf "Air"}) then {
    [_vehicle] __fsm(invulnerable);
};