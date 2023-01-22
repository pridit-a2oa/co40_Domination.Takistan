/**
 * Inventory Module (Handler)
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

if (!isNil QMODULE(construction)) then {
    __submodulePP(construction);
};