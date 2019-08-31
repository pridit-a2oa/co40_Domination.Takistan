/**
 * Halo Module - Vehicle Submodule
 */

#define THIS_MODULE halo
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle isKindOf "Air") exitWith {};

if (!isNil QMODULE(perk)) then {
    [_vehicle] __submoduleVM(perk);
};