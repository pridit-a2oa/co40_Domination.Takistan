/**
 * Vehicle Ammobox (Handler)
 */

#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(3d)) then {
        __submoduleVM(3d);
    };
};