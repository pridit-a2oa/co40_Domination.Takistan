/**
 * Base Teleport Module (Handler)
 */

#define THIS_MODULE base_teleport
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(teleport)) then {
        __submodule(teleport);
    };
};