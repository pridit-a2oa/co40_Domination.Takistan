/**
 * Base Halo Module
 */

#define THIS_MODULE base_halo
#include "x_macros.sqf"

if (!isNil QMODULE(halo)) then {
    __submodule(halo);
};

MODULE(THIS_MODULE) = true;