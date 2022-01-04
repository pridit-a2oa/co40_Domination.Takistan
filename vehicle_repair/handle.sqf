/**
 * Vehicle Repair Module (Handler)
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(inventory)) then {
        __submodulePP(inventory);
    };
};