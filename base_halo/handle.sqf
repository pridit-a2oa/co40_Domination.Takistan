/**
 * Base Halo Module (Handler)
 */

#define THIS_MODULE base_halo
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(halo)) then {
        __submodule(halo);
    };
};