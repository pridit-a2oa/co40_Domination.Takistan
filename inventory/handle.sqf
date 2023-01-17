/**
 * Inventory Module (Handler)
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

if (!isNil QMODULE(inventory_medical)) then {
    __submodulePP(inventory_medical);
};

if (!isNil QMODULE(inventory_repair)) then {
    __submodulePP(inventory_repair);
};

if (!isNil QMODULE(inventory_fuel)) then {
    __submodulePP(inventory_fuel);
};

if (!isNil QMODULE(fortification)) then {
    __submodulePP(fortification);
};

if (!isNil QMODULE(nest)) then {
    __submodulePP(nest);
};

if (!isNil QMODULE(farp)) then {
    __submodulePP(farp);
};

if (!isNil QMODULE(mash)) then {
    __submodulePP(mash);
};