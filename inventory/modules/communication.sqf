/**
 * Inventory Module - Communication Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

if (!isNil QMODULE(communication)) then {
    __submodulePP(communication);
};