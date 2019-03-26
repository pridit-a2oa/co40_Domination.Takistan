/**
 * Base Teleport Module
 */

#define THIS_MODULE base_teleport
#include "x_macros.sqf"

if (!isNil QMODULE(teleport)) then {
    __submodule(teleport);
};

MODULE(THIS_MODULE) = true;