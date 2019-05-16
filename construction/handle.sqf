/**
 * Construction Module (Handler)
 */

#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_type", "_object"];

_objects = [];

if (!isNil QMODULE(farp)) then {
    _objects = _objects + [["FARP", GVAR(farp_type)]];
};

if (!isNil QMODULE(mash)) then {
    _objects = _objects + [["MASH", GVAR(mash_type)]];
};

if (!isNil QMODULE(nest)) then {
    _objects = _objects + [["Nest", GVAR(nest_type)]];
};

if (!isNil QMODULE(fortification)) then {
    _objects = _objects + [["Fortification", GVAR(fortification_type)]];
};

GVAR(construction_type_objects) = _objects;

if (isServer) then {
    X_JIPH setVariable [QGVAR(constructed), [], true];
    
    __fsm(cleanup);
};