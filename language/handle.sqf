/**
 * Language Module (Handler)
 */

#define THIS_MODULE language
#include "x_macros.sqf"

if (hasInterface) then {
    if !(isNil QMODULE(vehicle_pack)) then {
        __submodulePP(vehicle_pack);
    };
};