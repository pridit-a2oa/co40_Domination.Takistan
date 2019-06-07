/**
 * Inventory Module (Handler)
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

if (!isNil QMODULE(medical)) then {
    __submodulePP(medical);
};

if (!isNil QMODULE(vehicle_repair)) then {
    __submodulePP(vehicle_repair);
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