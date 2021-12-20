/**
 * Profile Module (Handler)
 */

#define THIS_MODULE profile
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };
};