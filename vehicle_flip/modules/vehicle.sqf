/**
 * Vehicle Flip - Perk Submodule
 */

#define THIS_MODULE vehicle_flip
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(perk)) then {
    [_vehicle] __submodulePP(perk);
};